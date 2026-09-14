package controller.Tickets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import models.Employees.User;
import models.Tickets.Ticket;
import models.Tickets.TicketAttachment;
import service.Tickets.TicketService;
import serviceImplementer.Tickets.TicketServiceImpl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@WebServlet("/tickets")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 12 * 1024 * 1024
)
public class TicketServlet extends HttpServlet {

    private TicketService ticketService;

    @Override
    public void init() {
        ticketService = new TicketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SessionUser sessionUser = requireLogin(request, response);
        if (sessionUser == null) {
            return;
        }

        try {
            moveFlashToRequest(request);
            String action = trim(request.getParameter("action"));

            if ("view".equalsIgnoreCase(action)) {
                int ticketId = parsePositiveInt(request.getParameter("id"), "Invalid ticket id");
                Ticket ticket = ticketService.getTicketById(ticketId);

                if (ticket == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ticket not found");
                    return;
                }

                if (!canView(ticket, sessionUser)) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "You cannot view this ticket");
                    return;
                }

                request.setAttribute("ticket", ticket);
                request.setAttribute("comments", ticketService.getComments(ticketId));
                request.setAttribute("resolution", ticketService.getResolution(ticketId));
                request.setAttribute("attachments", ticketService.getAttachments(ticketId));

                if (isManagerOrAdmin(sessionUser.roleName)) {
                    List<User> employees = ticketService.getAssignableEmployees(ticket.getRaisedBy());
                    request.setAttribute("employees", employees);
                }

                request.getRequestDispatcher("/WEB-INF/views/Tickets/ticketDetails.jsp")
                        .forward(request, response);
                return;
            }

            request.setAttribute("tickets", ticketService.getTicketsForUser(sessionUser.userId, sessionUser.roleName));
            request.setAttribute("counts", ticketService.getDashboardCounts(sessionUser.userId, sessionUser.roleName));
            request.getRequestDispatcher("/WEB-INF/views/Tickets/tickets.jsp")
                    .forward(request, response);

        } catch (IllegalArgumentException e) {
            setFlash(request, "danger", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/tickets");
        } catch (RuntimeException e) {
            throw new ServletException("Unable to load tickets. Run src/main/resources/TicketSystem.sql first.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SessionUser sessionUser = requireLogin(request, response);
        if (sessionUser == null) {
            return;
        }

        String action = trim(request.getParameter("action"));

        try {
            switch (action.toLowerCase(Locale.ROOT)) {
                case "create":
                    createTicket(request, response, sessionUser);
                    return;
                case "assign":
                    assignTicket(request, response, sessionUser);
                    return;
                case "start":
                    startWork(request, response, sessionUser);
                    return;
                case "comment":
                    addComment(request, response, sessionUser);
                    return;
                case "resolve":
                    resolveTicket(request, response, sessionUser);
                    return;
                case "close":
                    closeTicket(request, response, sessionUser);
                    return;
                case "reopen":
                    reopenTicket(request, response, sessionUser);
                    return;
                default:
                    throw new IllegalArgumentException("Unsupported ticket action");
            }
        } catch (IllegalArgumentException e) {
            setFlash(request, "danger", e.getMessage());
            redirectBackToTicket(request, response);
        } catch (RuntimeException e) {
            setFlash(request, "danger", readableMessage(e));
            redirectBackToTicket(request, response);
        }
    }

    private void createTicket(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException, ServletException {

        if (!"Employee".equalsIgnoreCase(user.roleName)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only employees can raise tickets");
            return;
        }

        String subject = required(request.getParameter("subject"), "Subject is required");
        String description = required(request.getParameter("description"), "Description is required");
        String priority = normalizePriority(request.getParameter("priority"));

        if (subject.length() > 200) {
            throw new IllegalArgumentException("Subject must be 200 characters or less");
        }

        Ticket created = ticketService.createTicket(subject, description, priority, user.userId);
        saveUploadedPart(request.getPart("attachment"), created.getTicketId(), user.userId, "TICKET");

        setFlash(request, "success", "Ticket " + created.getTicketNo() + " raised successfully");
        response.sendRedirect(request.getContextPath() + "/tickets?action=view&id=" + created.getTicketId());
    }

    private void assignTicket(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException {

        if (!isManagerOrAdmin(user.roleName)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only a manager or admin can assign tickets");
            return;
        }

        int ticketId = ticketId(request);
        int assignedTo = parsePositiveInt(request.getParameter("assignedTo"), "Select an employee to assign");
        String comment = trim(request.getParameter("assignmentComment"));

        Ticket ticket = requiredTicket(ticketId);
        if (!canView(ticket, user)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        if (!("Open".equalsIgnoreCase(ticket.getStatus()) || "Reopened".equalsIgnoreCase(ticket.getStatus()))) {
            throw new IllegalArgumentException("Only Open or Reopened tickets can be assigned");
        }

        if (assignedTo == ticket.getRaisedBy()) {
            throw new IllegalArgumentException("A ticket cannot be assigned to the employee who raised it");
        }

        ticketService.assignTicket(ticketId, user.userId, assignedTo, comment);
        setFlash(request, "success", "Ticket assigned successfully");
        redirectToTicket(request, response, ticketId);
    }

    private void startWork(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException {

        int ticketId = ticketId(request);
        Ticket ticket = requiredTicket(ticketId);

        if (!isAssignedEmployee(ticket, user)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only the assigned employee can start work");
            return;
        }

        if (!"Assigned".equalsIgnoreCase(ticket.getStatus())) {
            throw new IllegalArgumentException("This ticket is not waiting to start");
        }

        ticketService.startWork(ticketId, user.userId);
        setFlash(request, "success", "Ticket moved to In Progress");
        redirectToTicket(request, response, ticketId);
    }

    private void addComment(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException {

        int ticketId = ticketId(request);
        Ticket ticket = requiredTicket(ticketId);

        if (!canView(ticket, user)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        if ("Closed".equalsIgnoreCase(ticket.getStatus())) {
            throw new IllegalArgumentException("Closed tickets cannot receive new comments");
        }

        String comment = required(request.getParameter("commentText"), "Comment cannot be empty");
        ticketService.addComment(ticketId, user.userId, comment);
        setFlash(request, "success", "Comment added");
        redirectToTicket(request, response, ticketId);
    }

    private void resolveTicket(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException, ServletException {

        int ticketId = ticketId(request);
        Ticket ticket = requiredTicket(ticketId);

        if (!isAssignedEmployee(ticket, user)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only the assigned employee can resolve this ticket");
            return;
        }

        if (!("Assigned".equalsIgnoreCase(ticket.getStatus()) || "In Progress".equalsIgnoreCase(ticket.getStatus()))) {
            throw new IllegalArgumentException("This ticket cannot be resolved in its current status");
        }

        String solution = required(request.getParameter("solution"), "Solution is required");
        String notes = trim(request.getParameter("resolutionNotes"));

        ticketService.resolveTicket(ticketId, user.userId, solution, notes);
        saveUploadedPart(request.getPart("resolutionAttachment"), ticketId, user.userId, "RESOLUTION");

        setFlash(request, "success", "Ticket marked as Resolved");
        redirectToTicket(request, response, ticketId);
    }

    private void closeTicket(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException {

        int ticketId = ticketId(request);
        Ticket ticket = requiredTicket(ticketId);

        if (ticket.getRaisedBy() != user.userId) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only the sender can close the ticket");
            return;
        }

        if (!"Resolved".equalsIgnoreCase(ticket.getStatus())) {
            throw new IllegalArgumentException("Only a resolved ticket can be closed");
        }

        ticketService.closeTicket(ticketId, user.userId);
        setFlash(request, "success", "Ticket closed successfully");
        redirectToTicket(request, response, ticketId);
    }

    private void reopenTicket(HttpServletRequest request, HttpServletResponse response, SessionUser user)
            throws IOException {

        int ticketId = ticketId(request);
        Ticket ticket = requiredTicket(ticketId);

        if (ticket.getRaisedBy() != user.userId) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only the sender can reopen the ticket");
            return;
        }

        if (!"Resolved".equalsIgnoreCase(ticket.getStatus())) {
            throw new IllegalArgumentException("Only a resolved ticket can be reopened");
        }

        String reason = required(request.getParameter("reopenReason"), "Please enter why the solution is not satisfactory");
        ticketService.reopenTicket(ticketId, user.userId, reason);
        setFlash(request, "success", "Ticket reopened and returned for manager assignment");
        redirectToTicket(request, response, ticketId);
    }

    private void saveUploadedPart(
            Part part,
            int ticketId,
            int uploadedBy,
            String type
    ) throws IOException {

        if (part == null || part.getSize() == 0) {
            return;
        }

        String originalName = safeFileName(part.getSubmittedFileName());

        if (originalName == null || originalName.trim().isEmpty()) {
            return;
        }

        String extension = "";

        int dotIndex = originalName.lastIndexOf('.');

        if (dotIndex >= 0 && dotIndex < originalName.length() - 1) {
            extension = originalName.substring(dotIndex);
        }

        String storedName = UUID.randomUUID().toString() + extension;

        // Ticket files will be saved inside:
        // Content/uploads/tickets
        String uploadPath =
                getServletContext().getRealPath("/Content/uploads/tickets");

        if (uploadPath == null) {
            throw new IOException(
                    "Unable to determine Content/uploads/tickets directory"
            );
        }

        Path uploadDirectory =
                Paths.get(uploadPath)
                        .toAbsolutePath()
                        .normalize();

        // Automatically creates "tickets" folder if it doesn't exist
        Files.createDirectories(uploadDirectory);

        Path target =
                uploadDirectory
                        .resolve(storedName)
                        .normalize();

        if (!target.startsWith(uploadDirectory)) {
            throw new IOException("Invalid upload path");
        }

        try (InputStream inputStream = part.getInputStream()) {

            Files.copy(
                    inputStream,
                    target,
                    StandardCopyOption.REPLACE_EXISTING
            );
        }

        TicketAttachment attachment = new TicketAttachment();

        attachment.setTicketId(ticketId);
        attachment.setFileName(originalName);
        attachment.setStoredName(storedName);
        attachment.setFilePath(target.toString());

        String contentType = part.getContentType();

        if (contentType == null || contentType.trim().isEmpty()) {
            contentType = "application/octet-stream";
        }

        attachment.setContentType(contentType);
        attachment.setAttachmentType(type);
        attachment.setUploadedBy(uploadedBy);
        attachment.setUploadedDate(LocalDateTime.now());

        ticketService.addAttachment(attachment);
    }

    private SessionUser requireLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || session.getAttribute("roleName") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return null;
        }

        Object userIdValue = session.getAttribute("userId");
        int userId = userIdValue instanceof Number
                ? ((Number) userIdValue).intValue()
                : Integer.parseInt(userIdValue.toString());

        return new SessionUser(userId, String.valueOf(session.getAttribute("roleName")));
    }

    private boolean canView(Ticket ticket, SessionUser user) {
        if (isManagerOrAdmin(user.roleName)) {
            return true;
        }
        return ticket.getRaisedBy() == user.userId
                || (ticket.getAssignedTo() != null && ticket.getAssignedTo() == user.userId);
    }

    private boolean isAssignedEmployee(Ticket ticket, SessionUser user) {
        return "Employee".equalsIgnoreCase(user.roleName)
                && ticket.getAssignedTo() != null
                && ticket.getAssignedTo() == user.userId;
    }

    private boolean isManagerOrAdmin(String roleName) {
        return "Manager".equalsIgnoreCase(roleName) || "Admin".equalsIgnoreCase(roleName);
    }

    private Ticket requiredTicket(int ticketId) {
        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket == null) {
            throw new IllegalArgumentException("Ticket not found");
        }
        return ticket;
    }

    private int ticketId(HttpServletRequest request) {
        return parsePositiveInt(request.getParameter("ticketId"), "Invalid ticket id");
    }

    private int parsePositiveInt(String value, String message) {
        try {
            int parsed = Integer.parseInt(value);
            if (parsed <= 0) {
                throw new NumberFormatException();
            }
            return parsed;
        } catch (Exception e) {
            throw new IllegalArgumentException(message);
        }
    }

    private String required(String value, String message) {
        String result = trim(value);
        if (result.isEmpty()) {
            throw new IllegalArgumentException(message);
        }
        return result;
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }

    private String normalizePriority(String value) {
        String priority = trim(value);
        if ("Low".equalsIgnoreCase(priority)) return "Low";
        if ("Medium".equalsIgnoreCase(priority)) return "Medium";
        if ("High".equalsIgnoreCase(priority)) return "High";
        throw new IllegalArgumentException("Select Low, Medium, or High priority");
    }

    private String safeFileName(String value) {
        if (value == null) return "";
        String clean = value.replace('\\', '/');
        int slash = clean.lastIndexOf('/');
        if (slash >= 0) clean = clean.substring(slash + 1);
        return clean.replaceAll("[\\r\\n]", "").trim();
    }

    private void redirectBackToTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ticketId = trim(request.getParameter("ticketId"));
        if (!ticketId.isEmpty() && ticketId.matches("\\d+")) {
            response.sendRedirect(request.getContextPath() + "/tickets?action=view&id=" + ticketId);
        } else {
            response.sendRedirect(request.getContextPath() + "/tickets");
        }
    }

    private void redirectToTicket(HttpServletRequest request, HttpServletResponse response, int ticketId) throws IOException {
        response.sendRedirect(request.getContextPath() + "/tickets?action=view&id=" + ticketId);
    }

    private void setFlash(HttpServletRequest request, String type, String message) {
        HttpSession session = request.getSession();
        session.setAttribute("ticketFlashType", type);
        session.setAttribute("ticketFlashMessage", message);
    }

    private void moveFlashToRequest(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return;
        Object type = session.getAttribute("ticketFlashType");
        Object message = session.getAttribute("ticketFlashMessage");
        if (message != null) {
            request.setAttribute("flashType", type == null ? "info" : type.toString());
            request.setAttribute("flashMessage", message.toString());
            session.removeAttribute("ticketFlashType");
            session.removeAttribute("ticketFlashMessage");
        }
    }

    private String readableMessage(RuntimeException e) {
        Throwable current = e;

        while (current.getCause() != null) {
            current = current.getCause();
        }

        String message = current.getMessage();

        if (message == null || message.trim().isEmpty()) {
            message = e.getMessage();
        }

        if (message == null || message.trim().isEmpty()) {
            return "Ticket operation failed";
        }

        return message.length() > 260
                ? message.substring(0, 260)
                : message;
    }

    private static class SessionUser {
        final int userId;
        final String roleName;

        SessionUser(int userId, String roleName) {
            this.userId = userId;
            this.roleName = roleName;
        }
    }
}
