package controller.Events;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Events.EventService;
import serviceImplementer.Events.EventServiceImpl;

import java.io.IOException;

@WebServlet("/employee/events")
public class EmployeeEventServlet extends HttpServlet {

    private EventService eventService;

    @Override
    public void init() {
        eventService = new EventServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("events", eventService.getActiveEvents());
            request.getRequestDispatcher("/WEB-INF/views/Employee/events.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to load employee event calendar. Run EventModule.sql first.", e);
        }
    }
}
