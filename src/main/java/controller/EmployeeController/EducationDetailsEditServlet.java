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

@WebServlet("/employee/education/edit")
public class EducationDetailsEditServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String educationDetailsIdParameter =
                request.getParameter("educationDetailsId");

        if (educationDetailsIdParameter == null ||
                educationDetailsIdParameter.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/employees");

            return;
        }

        int educationDetailsId =
                Integer.parseInt(educationDetailsIdParameter);

        EmployeeEducationDetails educationDetails =
                employeeDetailsService
                        .getEducationDetailsById(educationDetailsId);

        request.setAttribute(
                "educationDetails",
                educationDetails);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/edit-education.jsp");

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int educationDetailsId =
                Integer.parseInt(
                        request.getParameter("educationDetailsId"));

        int userId =
                Integer.parseInt(
                        request.getParameter("userId"));

        String educationType =
                request.getParameter("educationType");

        String universityName =
                request.getParameter("universityName");

        String startDateParameter =
                request.getParameter("startDate");

        String endDateParameter =
                request.getParameter("endDate");

        EmployeeEducationDetails educationDetails =
                new EmployeeEducationDetails();

        educationDetails.setEducationDetailsId(
                educationDetailsId);

        educationDetails.setEducationType(
                educationType);

        educationDetails.setUniversityName(
                universityName);

        educationDetails.setUserId(userId);

        if (startDateParameter != null &&
                !startDateParameter.isEmpty()) {

            educationDetails.setStartdate(
                    LocalDateTime.parse(startDateParameter));
        }

        if (endDateParameter != null &&
                !endDateParameter.isEmpty()) {

            educationDetails.setEnddate(
                    LocalDateTime.parse(endDateParameter));
        }

        employeeDetailsService.updateEducationDetails(
                educationDetails);

        response.sendRedirect(
                request.getContextPath()
                        + "/employee/details?userId="
                        + userId);
    }
}