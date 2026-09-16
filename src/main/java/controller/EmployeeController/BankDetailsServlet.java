package controller.EmployeeController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Employees.EmployeeBankDetails;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;

@WebServlet("/employee/bank/add")
public class BankDetailsServlet extends HttpServlet {

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
                        "/WEB-INF/views/Admin/add-bank.jsp"
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

        String bankName =
                request.getParameter("bankName");

        String accountNumber =
                request.getParameter("accountNumber");

        String ifscCode =
                request.getParameter("ifscCode");

        String branchName =
                request.getParameter("branchName");

        EmployeeBankDetails bankDetails =
                new EmployeeBankDetails();

        bankDetails.setBankName(bankName);
        bankDetails.setAccountNumber(accountNumber);
        bankDetails.setIFSCCode(ifscCode);
        bankDetails.setBranchName(branchName);
        bankDetails.setUserId(userId);

        employeeDetailsService.addBankDetails(bankDetails);

        response.sendRedirect(
                request.getContextPath()
                        + "/employee/details?userId="
                        + userId
        );
    }
}