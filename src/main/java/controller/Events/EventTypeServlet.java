package controller.Events;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Events.EventTypes;
import service.Events.EventTypeService;
import serviceImplementer.Events.EventTypeServiceImpl;

import java.io.IOException;

@WebServlet("/admin/event-types")
public class EventTypeServlet extends HttpServlet {

    private EventTypeService eventTypeService;

    @Override
    public void init() {
        eventTypeService = new EventTypeServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request, response)) {
            return;
        }

        try {
            request.setAttribute("eventTypes", eventTypeService.getAllEventTypes());
            request.getRequestDispatcher("/WEB-INF/views/Admin/eventTypes.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to load event types. Run EventModule.sql first.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request, response)) {
            return;
        }

        try {
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("eventTypeId"));
                boolean deleted = eventTypeService.deleteEventType(id);
                response.sendRedirect(request.getContextPath() + "/admin/event-types?message="
                        + (deleted ? "deleted" : "inuse"));
                return;
            }

            EventTypes eventType = new EventTypes();
            eventType.setEventTypeName(request.getParameter("eventTypeName"));
            eventType.setColor(request.getParameter("color"));
            eventTypeService.addEventType(eventType);

            response.sendRedirect(request.getContextPath() + "/admin/event-types?message=added");

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            doGet(request, response);
        }
    }

    private boolean isAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        Object role = session.getAttribute("roleName");
        if (role != null && !"Admin".equalsIgnoreCase(String.valueOf(role))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required");
            return false;
        }
        return true;
    }
}
