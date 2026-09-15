package controller.EmployeeController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Employees.EmployeeDetails;
import models.Projects.AllProjects;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@WebServlet("/employee/details")
public class EmployeeDetailsServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("======================================");
        System.out.println("NEW EMPLOYEE DETAILS SERVLET RUNNING");
        System.out.println("======================================");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String userIdParameter = request.getParameter("userId");

        int userId;

        if (userIdParameter != null && !userIdParameter.isEmpty()) {
            userId = Integer.parseInt(userIdParameter);
        } else {
            userId = (int) session.getAttribute("userId");
        }
        EmployeeDetails employeeDetails =
                employeeDetailsService.getEmployeeDetails(userId);

        List<AllProjects> projects =
                null;
        try {
            projects = employeeDetailsService.getProjectsByUserId(userId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("projects", projects);

        request.setAttribute("employeeDetails", employeeDetails);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/employee-details.jsp"
                );

        dispatcher.forward(request, response);
    }


}