package controller.EmployeeController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;

@WebServlet("/employee/bank/delete")
public class BankDetailsDeleteServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int bankDetailId =
                Integer.parseInt(request.getParameter("bankDetailId"));

        int userId =
                Integer.parseInt(request.getParameter("userId"));

        employeeDetailsService.deleteBankDetails(bankDetailId);

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/employees?action=view&id="
                        + userId
        );
    }
}