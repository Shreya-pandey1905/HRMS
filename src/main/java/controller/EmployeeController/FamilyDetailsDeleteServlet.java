package controller.EmployeeController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;

@WebServlet("/employee/family/delete")
public class FamilyDetailsDeleteServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int familyDetailId =
                Integer.parseInt(request.getParameter("familyDetailId"));

        int userId =
                Integer.parseInt(request.getParameter("userId"));

        employeeDetailsService.deleteFamilyDetails(familyDetailId);

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/employees?action=view&id="
                        + userId
        );
    }
}