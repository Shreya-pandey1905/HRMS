package controller.Tickets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Tickets.Ticket;
import models.Tickets.TicketAttachment;
import service.Tickets.TicketService;
import serviceImplementer.Tickets.TicketServiceImpl;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/ticket-file")
public class TicketFileServlet extends HttpServlet {
    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || session.getAttribute("roleName") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        int attachmentId;
        try {
            attachmentId = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid attachment id");
            return;
        }

        TicketAttachment attachment = ticketService.getAttachmentById(attachmentId);
        if (attachment == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Attachment not found");
            return;
        }

        Ticket ticket = ticketService.getTicketById(attachment.getTicketId());
        if (ticket == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ticket not found");
            return;
        }

        Object sessionUserId = session.getAttribute("userId");
        int userId = sessionUserId instanceof Number
                ? ((Number) sessionUserId).intValue()
                : Integer.parseInt(String.valueOf(sessionUserId));
        String roleName = String.valueOf(session.getAttribute("roleName"));
        boolean allowed = "Admin".equalsIgnoreCase(roleName)
                || "Manager".equalsIgnoreCase(roleName)
                || ticket.getRaisedBy() == userId
                || (ticket.getAssignedTo() != null && ticket.getAssignedTo() == userId);

        if (!allowed) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        Path file = Paths.get(attachment.getFilePath()).toAbsolutePath().normalize();
        if (!Files.exists(file) || !Files.isRegularFile(file)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Uploaded file no longer exists on the server");
            return;
        }

        response.setContentType(attachment.getContentType() == null
                ? "application/octet-stream"
                : attachment.getContentType());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + safeHeaderName(attachment.getFileName()) + "\"");
        response.setContentLengthLong(Files.size(file));

        try (OutputStream output = response.getOutputStream()) {
            Files.copy(file, output);
        }
    }

    private String safeHeaderName(String value) {
        if (value == null || value.trim().isEmpty()) {
            return "attachment";
        }
        return value.replace("\"", "").replace("\r", "").replace("\n", "");
    }
}
