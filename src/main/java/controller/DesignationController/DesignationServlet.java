package controller.DesignationController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Employees.Department;
import models.Employees.Designation;
import service.Department.DepartmentService;
import service.Designation.DesignationService;
import serviceImplementer.Department.DepartmentServiceImpl;
import serviceImplementer.Designation.DesignationServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/designations")
public class DesignationServlet extends HttpServlet {

    private DesignationService designationService;
    private DepartmentService departmentService;

    @Override
    public void init() throws ServletException {
        designationService = new DesignationServiceImpl();
        departmentService = new DepartmentServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Designation> designations = designationService.getAllDesignations();
        List<Department> departments = departmentService.getAllDepartments();

        request.setAttribute("designations", designations);
        request.setAttribute("departments", departments);

        request.getRequestDispatcher(
                "/WEB-INF/views/Admin/designations.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if (action == null || action.isEmpty()) {
            addDesignation(request, response, session);
            return;
        }

        switch (action) {
            case "update":
                updateDesignation(request, response, session);
                break;

            case "delete":
                deleteDesignation(request, response, session);
                break;

            default:
                addDesignation(request, response, session);
                break;
        }
    }

    private void addDesignation(HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session)
            throws IOException {
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String name = request.getParameter("name");
        String noOfEmployeeParameter = request.getParameter("noOfEmployee");
        String status = request.getParameter("status");

        Designation designation = new Designation();
        designation.setDepartmentId(departmentId);
        designation.setName(name);
        designation.setStatus(status);

        if (noOfEmployeeParameter != null && !noOfEmployeeParameter.isEmpty()) {
            designation.setNoOfEmployee(Integer.parseInt(noOfEmployeeParameter));
        }

        designation.setCreatedBy("Admin");

        boolean result = designationService.addDesignation(designation);

        if (result) {
            session.setAttribute("success", "Designation added successfully.");
        } else {
            session.setAttribute("error", "Failed to add designation.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/designations");
    }

    private void updateDesignation(HttpServletRequest request,
                                   HttpServletResponse response,
                                   HttpSession session)
            throws IOException {
        int designationId = Integer.parseInt(request.getParameter("designationId"));
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String name = request.getParameter("name");
        String noOfEmployeeParameter = request.getParameter("noOfEmployee");
        String status = request.getParameter("status");

        Designation designation = new Designation();
        designation.setDesignationId(designationId);
        designation.setDepartmentId(departmentId);
        designation.setName(name);
        designation.setStatus(status);

        if (noOfEmployeeParameter != null && !noOfEmployeeParameter.isEmpty()) {
            designation.setNoOfEmployee(Integer.parseInt(noOfEmployeeParameter));
        }

        designation.setModifiedBy("Admin");

        boolean result = designationService.updateDesignation(designation);

        if (result) {
            session.setAttribute("success", "Designation updated successfully.");
        } else {
            session.setAttribute("error", "Failed to update designation.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/designations");
    }

    private void deleteDesignation(HttpServletRequest request,
                                   HttpServletResponse response,
                                   HttpSession session)
            throws IOException {
        int designationId = Integer.parseInt(request.getParameter("designationId"));

        boolean result = designationService.deleteDesignation(designationId);

        if (result) {
            session.setAttribute("success", "Designation deleted successfully.");
        } else {
            session.setAttribute("error", "Failed to delete designation.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/designations");
    }
}
