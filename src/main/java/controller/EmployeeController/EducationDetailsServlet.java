package controller.EmployeeController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Employees.EmployeeEducationDetails;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/employee/education/add")
public class EducationDetailsServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String userIdParameter = request.getParameter("userId");

        if (userIdParameter == null || userIdParameter.isEmpty()) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/employees"
            );
            return;
        }

        int userId = Integer.parseInt(userIdParameter);

        request.setAttribute("userId", userId);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/add-education.jsp"
                );

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(
                request.getParameter("userId")
        );

        String educationType =
                request.getParameter("educationType");

        String universityName =
                request.getParameter("universityName");

        String startDateParameter =
                request.getParameter("startDate");

        String endDateParameter =
                request.getParameter("endDate");

        EmployeeEducationDetails education =
                new EmployeeEducationDetails();

        education.setEducationType(educationType);
        education.setUniversityName(universityName);
        education.setUserId(userId);

        if (startDateParameter != null &&
                !startDateParameter.isEmpty()) {

            education.setStartdate(
                    LocalDateTime.parse(startDateParameter)
            );
        }

        if (endDateParameter != null &&
                !endDateParameter.isEmpty()) {

            education.setEnddate(
                    LocalDateTime.parse(endDateParameter)
            );
        }

        employeeDetailsService.addEducationDetails(education);

        response.sendRedirect(
                request.getContextPath()
                        + "/employee/details?userId="
                        + userId
        );
    }
}