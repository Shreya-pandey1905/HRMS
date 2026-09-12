package controller.Terminations;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Employees.User;
import models.Terminations.Termination;

import service.Terminations.TerminationService;
import service.User.UserService;

import serviceImplementer.Auth.UserServiceImpl;
import serviceImplementer.Terminations.TerminationServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/termination")
public class TerminationServlet extends HttpServlet {

    private TerminationService terminationService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        terminationService = new TerminationServiceImpl();
        userService = new UserServiceImpl();
    }

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action = request.getParameter("action");

            // ADD TERMINATION PAGE
            if ("add".equals(action)) {

                loadFormData(request);

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addTermination.jsp"
                ).forward(request, response);

                return;
            }

            // EDIT TERMINATION PAGE
            if ("edit".equals(action)) {

                int terminationId = Integer.parseInt(
                        request.getParameter("id")
                );

                Termination termination =
                        terminationService.getTerminationById(terminationId);

                if (termination == null) {
                    response.sendRedirect(
                            request.getContextPath() + "/termination"
                    );
                    return;
                }

                loadFormData(request);

                request.setAttribute("termination", termination);

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addTermination.jsp"
                ).forward(request, response);

                return;
            }

            // TERMINATION LIST PAGE
            List<Termination> terminations =
                    terminationService.getAllTerminations();

            request.setAttribute("terminations", terminations);

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/Termination.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load termination page", e
            );
        }
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action = request.getParameter("action");

            // DELETE TERMINATION
            if ("delete".equals(action)) {

                int terminationId = Integer.parseInt(
                        request.getParameter("terminationId")
                );

                terminationService.deleteTermination(terminationId);

                response.sendRedirect(
                        request.getContextPath() + "/termination"
                );

                return;
            }

            // FORM VALUES
            int userId = Integer.parseInt(
                    request.getParameter("userId")
            );

            String terminationType =
                    request.getParameter("terminationType");

            String noticeDate =
                    request.getParameter("noticeDate");

            String resignDate =
                    request.getParameter("resignDate");

            String reason =
                    request.getParameter("reason");

            DateTimeFormatter formatter =
                    DateTimeFormatter.ofPattern("dd/MM/yyyy");

            LocalDate noticeLocalDate =
                    LocalDate.parse(noticeDate, formatter);

            LocalDate resignLocalDate =
                    LocalDate.parse(resignDate, formatter);

            // EDIT TERMINATION
            if ("edit".equals(action)) {

                int terminationId = Integer.parseInt(
                        request.getParameter("terminationId")
                );

                Termination termination = new Termination();

                termination.setTerminationId(terminationId);
                termination.setUserId(userId);
                termination.setTerminationType(terminationType);
                termination.setNoticeDate(noticeLocalDate.atStartOfDay());
                termination.setResignDate(resignLocalDate.atStartOfDay());
                termination.setReason(reason);

                terminationService.updateTermination(termination);

                response.sendRedirect(
                        request.getContextPath() + "/termination"
                );

                return;
            }

            // ADD TERMINATION
            Termination termination = new Termination();

            termination.setUserId(userId);
            termination.setTerminationType(terminationType);
            termination.setNoticeDate(noticeLocalDate.atStartOfDay());
            termination.setResignDate(resignLocalDate.atStartOfDay());
            termination.setReason(reason);

            terminationService.addTermination(termination);

            response.sendRedirect(
                    request.getContextPath() + "/termination"
            );

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to save termination", e
            );
        }
    }

    // =========================================================
    // LOAD FORM DATA
    // =========================================================

    private void loadFormData(HttpServletRequest request) {

        List<User> users = userService.getAllEmployees();

        request.setAttribute("users", users);
    }
}
