package controller.DepartmentController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Employees.Department;
import service.Department.DepartmentService;
import serviceImplementer.Department.DepartmentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/departments")
public class DepartmentServlet extends HttpServlet {

    private final DepartmentService departmentService = new DepartmentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Department> departments = departmentService.getAllDepartments();
        request.setAttribute("departments", departments);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Admin/departments.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateDepartment(request, response);
        } else if ("delete".equals(action)) {
            deleteDepartment(request, response);
        } else {
            addDepartment(request, response);
        }
    }

    private void addDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String status = request.getParameter("status");

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Department name is required.");
            forwardToDepartmentPage(request, response);
            return;
        }

        if (status == null || status.trim().isEmpty()) {
            request.setAttribute("error", "Department status is required.");
            forwardToDepartmentPage(request, response);
            return;
        }

        Department department = new Department();
        department.setName(name.trim());
        department.setStatus(status);
        department.setCreatedBy("Admin");

        boolean success = departmentService.addDepartment(department);

        if (success) {
            request.setAttribute("success", "Department added successfully.");
        } else {
            request.setAttribute("error", "Failed to add department.");
        }

        forwardToDepartmentPage(request, response);
    }

    private void updateDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String departmentIdValue = request.getParameter("departmentId");
        String name = request.getParameter("name");
        String status = request.getParameter("status");

        if (departmentIdValue == null || departmentIdValue.trim().isEmpty()) {
            request.setAttribute("error", "Invalid department.");
            forwardToDepartmentPage(request, response);
            return;
        }

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Department name is required.");
            forwardToDepartmentPage(request, response);
            return;
        }

        if (status == null || status.trim().isEmpty()) {
            request.setAttribute("error", "Department status is required.");
            forwardToDepartmentPage(request, response);
            return;
        }

        try {
            int departmentId = Integer.parseInt(departmentIdValue);

            Department department = new Department();
            department.setDepartmentId(departmentId);
            department.setName(name.trim());
            department.setStatus(status);
            department.setModifiedBy("Admin");

            boolean success = departmentService.updateDepartment(department);

            if (success) {
                request.setAttribute("success", "Department updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update department.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid department ID.");
        }

        forwardToDepartmentPage(request, response);
    }

    private void deleteDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String departmentIdValue = request.getParameter("departmentId");

        if (departmentIdValue == null || departmentIdValue.trim().isEmpty()) {
            request.setAttribute("error", "Invalid department.");
            forwardToDepartmentPage(request, response);
            return;
        }

        try {
            int departmentId = Integer.parseInt(departmentIdValue);

            boolean success = departmentService.deleteDepartment(departmentId);

            if (success) {
                request.setAttribute("success", "Department deleted successfully.");
            } else {
                request.setAttribute("error", "Failed to delete department.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid department ID.");
        } catch (RuntimeException e) {
            request.setAttribute("error", e.getMessage());
        }

        forwardToDepartmentPage(request, response);
    }

    private void forwardToDepartmentPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Department> departments = departmentService.getAllDepartments();
        request.setAttribute("departments", departments);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Admin/departments.jsp");
        dispatcher.forward(request, response);
    }
}
