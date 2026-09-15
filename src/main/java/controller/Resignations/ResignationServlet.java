package controller.Resignations;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Employees.User;
import models.Resignations.Resignation;

import service.Resignations.ResignationService;
import service.User.UserService;

import serviceImplementer.Auth.UserServiceImpl;
import serviceImplementer.Resignations.ResignationServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/resignation")
public class ResignationServlet extends HttpServlet {

    private ResignationService resignationService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        resignationService = new ResignationServiceImpl();
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

            // ADD RESIGNATION PAGE
            if ("add".equals(action)) {

                loadFormData(request);

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addResignation.jsp"
                ).forward(request, response);

                return;
            }

            // EDIT RESIGNATION PAGE
            if ("edit".equals(action)) {

                int resignationId = Integer.parseInt(
                        request.getParameter("id")
                );

                Resignation resignation =
                        resignationService.getResignationById(resignationId);

                if (resignation == null) {
                    response.sendRedirect(
                            request.getContextPath() + "/resignation"
                    );
                    return;
                }

                loadFormData(request);

                request.setAttribute(
                        "resignation",
                        resignation
                );

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addResignation.jsp"
                ).forward(request, response);

                return;
            }

            // RESIGNATION LIST PAGE
            List<Resignation> resignations =
                    resignationService.getAllResignations();

            request.setAttribute(
                    "resignations",
                    resignations
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/Resignation.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to load resignation page",
                    e
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

            // DELETE RESIGNATION
            if ("delete".equals(action)) {

                int resignationId = Integer.parseInt(
                        request.getParameter("resignationId")
                );

                resignationService.deleteResignation(
                        resignationId
                );

                response.sendRedirect(
                        request.getContextPath() + "/resignation"
                );

                return;
            }

            // FORM VALUES
            int userId = Integer.parseInt(
                    request.getParameter("userId")
            );

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

            // =================================================
            // EDIT RESIGNATION
            // =================================================

            if ("edit".equals(action)) {

                int resignationId =
                        Integer.parseInt(
                                request.getParameter(
                                        "resignationId"
                                )
                        );

                Resignation resignation =
                        new Resignation();

                resignation.setResignationId(
                        resignationId
                );

                resignation.setUserId(
                        userId
                );

                resignation.setNoticeDate(
                        noticeLocalDate.atStartOfDay()
                );

                resignation.setReason(
                        reason
                );

                resignation.setResignDate(
                        resignLocalDate.atStartOfDay()
                );

                resignationService.updateResignation(
                        resignation
                );

                response.sendRedirect(
                        request.getContextPath() + "/resignation"
                );

                return;
            }

            // =================================================
            // ADD RESIGNATION
            // =================================================

            Resignation resignation =
                    new Resignation();

            resignation.setUserId(
                    userId
            );

            resignation.setNoticeDate(
                    noticeLocalDate.atStartOfDay()
            );

            resignation.setReason(
                    reason
            );

            resignation.setResignDate(
                    resignLocalDate.atStartOfDay()
            );

            resignationService.addResignation(
                    resignation
            );

            response.sendRedirect(
                    request.getContextPath() + "/resignation"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save resignation",
                    e
            );
        }
    }

    // =========================================================
    // LOAD FORM DATA
    // =========================================================

    private void loadFormData(
            HttpServletRequest request) {

        List<User> users =
                userService.getAllEmployees();

        request.setAttribute(
                "users",
                users
        );
    }
}