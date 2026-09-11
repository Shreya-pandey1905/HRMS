package controller.TrainingController;

import dao.Trainers.EmployeeTrainingDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Trainers.Training;

import java.io.IOException;
import java.util.List;

@WebServlet("/employee/trainings")
public class EmployeeTrainingServlet extends HttpServlet {

    private EmployeeTrainingDao employeeTrainingDao;

    @Override
    public void init() {
        employeeTrainingDao = new EmployeeTrainingDao();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if (session == null ||
                    session.getAttribute("userId") == null) {

                response.sendRedirect(
                        request.getContextPath() + "/login"
                );

                return;
            }

            int userId =
                    (Integer) session.getAttribute("userId");

            List<Training> trainings =
                    employeeTrainingDao.getMyTrainings(userId);

            request.setAttribute(
                    "trainings",
                    trainings
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Employee/trainings.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to load employee trainings",
                    e
            );
        }
    }
}