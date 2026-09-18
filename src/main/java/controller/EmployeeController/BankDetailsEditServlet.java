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

@WebServlet("/employee/bank/edit")
public class BankDetailsEditServlet extends HttpServlet {

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
        String bankDetailIdParameter = request.getParameter("bankDetailId");

        if (userIdParameter == null || userIdParameter.isEmpty()
                || bankDetailIdParameter == null || bankDetailIdParameter.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/employees"
            );
            return;
        }

        int userId = Integer.parseInt(userIdParameter);
        int bankDetailId = Integer.parseInt(bankDetailIdParameter);

        EmployeeBankDetails bankDetails =
                employeeDetailsService.getBankDetailsById(bankDetailId);

        request.setAttribute("bankDetails", bankDetails);
        request.setAttribute("userId", userId);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/edit-bank.jsp"
                );

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int bankDetailId = Integer.parseInt(
                request.getParameter("bankDetailId")
        );

        int userId = Integer.parseInt(
                request.getParameter("userId")
        );

        EmployeeBankDetails bankDetails =
                new EmployeeBankDetails();

        bankDetails.setBankDetailId(bankDetailId);
        bankDetails.setBankName(
                request.getParameter("bankName")
        );
        bankDetails.setAccountNumber(
                request.getParameter("accountNumber")
        );
        bankDetails.setIFSCCode(
                request.getParameter("ifscCode")
        );
        bankDetails.setBranchName(
                request.getParameter("branchName")
        );
        bankDetails.setUserId(userId);

        employeeDetailsService.updateBankDetails(bankDetails);

        response.sendRedirect(
                request.getContextPath()
                        + "/employee/details?userId="
                        + userId
        );
    }
}