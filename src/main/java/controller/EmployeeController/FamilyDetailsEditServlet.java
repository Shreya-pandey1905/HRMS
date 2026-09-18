package controller.EmployeeController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Employees.EmployeeFamilyDetails;
import service.Employee.EmployeeDetailsService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/employee/family/edit")
public class FamilyDetailsEditServlet extends HttpServlet {

    private EmployeeDetailsService employeeDetailsService;

    @Override
    public void init() {
        employeeDetailsService = new EmployeeDetailsServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String familyDetailIdParameter =
                request.getParameter("familyDetailId");

        if (familyDetailIdParameter == null ||
                familyDetailIdParameter.isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/employees");

            return;
        }

        int familyDetailId =
                Integer.parseInt(familyDetailIdParameter);

        EmployeeFamilyDetails familyDetails =
                employeeDetailsService
                        .getFamilyDetailsById(familyDetailId);

        request.setAttribute("familyDetails", familyDetails);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/edit-family.jsp");

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int familyDetailId =
                Integer.parseInt(
                        request.getParameter("familyDetailId"));

        int userId =
                Integer.parseInt(
                        request.getParameter("userId"));

        String name =
                request.getParameter("name");

        String relation =
                request.getParameter("relation");

        String dateOfBirthParameter =
                request.getParameter("dateOfBirth");

        String phone =
                request.getParameter("phone");

        EmployeeFamilyDetails familyDetails =
                new EmployeeFamilyDetails();

        familyDetails.setFamilyDetailId(familyDetailId);
        familyDetails.setName(name);
        familyDetails.setRelation(relation);
        familyDetails.setPhone(phone);
        familyDetails.setUserId(userId);

        if (dateOfBirthParameter != null &&
                !dateOfBirthParameter.isEmpty()) {

            familyDetails.setDateOfBirth(
                    LocalDateTime.parse(dateOfBirthParameter));
        }

        employeeDetailsService.updateFamilyDetails(
                familyDetails);

        response.sendRedirect(
                request.getContextPath()
                        + "/employee/details?userId="
                        + userId);
    }
}