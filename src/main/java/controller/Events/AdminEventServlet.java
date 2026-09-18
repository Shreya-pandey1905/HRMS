package controller.Events;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Events.Events;
import service.Events.EventService;
import service.Events.EventTypeService;
import serviceImplementer.Events.EventServiceImpl;
import serviceImplementer.Events.EventTypeServiceImpl;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(urlPatterns = {"/admin/events", "/admin/events/list"})
public class AdminEventServlet extends HttpServlet {

    private EventService eventService;
    private EventTypeService eventTypeService;

    @Override
    public void init() {
        eventService = new EventServiceImpl();
        eventTypeService = new EventTypeServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request, response)) {
            return;
        }

        try {
            String servletPath = request.getServletPath();
            String action = request.getParameter("action");

            if ("/admin/events/list".equals(servletPath)) {
                request.setAttribute("events", eventService.getAllEvents());
                request.getRequestDispatcher("/WEB-INF/views/Admin/eventList.jsp")
                        .forward(request, response);
                return;
            }

            request.setAttribute("eventTypes", eventTypeService.getAllEventTypes());
            request.setAttribute("events", eventService.getActiveEvents());

            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("editEvent", eventService.getEventById(id));
                request.setAttribute("openEventModal", true);
            } else if ("add".equals(action)) {
                request.setAttribute("openEventModal", true);
            }

            request.getRequestDispatcher("/WEB-INF/views/Admin/events.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to load events. Run EventModule.sql first.", e);
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
                int eventId = Integer.parseInt(request.getParameter("eventId"));
                eventService.deleteEvent(eventId);
                response.sendRedirect(request.getContextPath() + "/admin/events/list?message=deleted");
                return;
            }

            Events event = new Events();
            event.setTitle(request.getParameter("title"));
            event.setEventDate(LocalDate.parse(request.getParameter("eventDate")));
            event.setEventTypeId(Integer.parseInt(request.getParameter("eventTypeId")));

            if ("edit".equals(action)) {
                event.setEventId(Integer.parseInt(request.getParameter("eventId")));
                event.setActive("true".equalsIgnoreCase(request.getParameter("active")));
                eventService.updateEvent(event);
                response.sendRedirect(request.getContextPath() + "/admin/events?message=updated");
            } else {
                event.setActive(true);
                eventService.addEvent(event);
                response.sendRedirect(request.getContextPath() + "/admin/events?message=added");
            }

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
