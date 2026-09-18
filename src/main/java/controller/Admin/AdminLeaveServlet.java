package controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Employees.Department;
import models.Payroll.DepartmentLeaves;
import models.Payroll.LeaveSettings;
import models.Payroll.MasterLeaveTypes;
import service.Admin.AdminLeaveService;
import serviceImplementer.Admin.AdminLeaveServiceImpl;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(urlPatterns = {
        "/admin/leave/add",
        "/admin/leave/type",
        "/admin/leave/type/delete",
        "/admin/leave/settings",
        "/admin/leave/settings/update",
        "/admin/leave/allocate",
        "/admin/leave/department-details",
        "/admin/leave/department/delete"
})
public class AdminLeaveServlet extends HttpServlet {

    private final AdminLeaveService service = new AdminLeaveServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request.getSession(false))) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String path = request.getServletPath();
        try {
            switch (path) {
                case "/admin/leave/type":
                    request.setAttribute("leaveTypes", service.getLeaveTypes());
                    forward(request, response, "/WEB-INF/views/Admin/leave/leavetype.jsp");
                    break;
                case "/admin/leave/add":
                    loadAllocationPage(request);
                    forward(request, response, "/WEB-INF/views/Admin/leave/addleave.jsp");
                    break;
                case "/admin/leave/settings":
                    request.setAttribute("leaveSettings", service.getLeaveSettings());
                    forward(request, response, "/WEB-INF/views/Admin/leave/leavesetting.jsp");
                    break;
                case "/admin/leave/department-details":
                    request.setAttribute("departmentLeaves", service.getDepartmentLeaveDetails());
                    forward(request, response, "/WEB-INF/views/Admin/leave/departmentleavedetails.jsp");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (RuntimeException e) {
            request.setAttribute("leaveError", rootMessage(e));
            if ("/admin/leave/type".equals(path)) {
                request.setAttribute("leaveTypes", Collections.emptyList());
                forward(request, response, "/WEB-INF/views/Admin/leave/leavetype.jsp");
            } else if ("/admin/leave/add".equals(path)) {
                loadAllocationPageSafely(request);
                forward(request, response, "/WEB-INF/views/Admin/leave/addleave.jsp");
            } else if ("/admin/leave/settings".equals(path)) {
                request.setAttribute("leaveSettings", Collections.emptyList());
                forward(request, response, "/WEB-INF/views/Admin/leave/leavesetting.jsp");
            } else if ("/admin/leave/department-details".equals(path)) {
                request.setAttribute("departmentLeaves", Collections.emptyList());
                forward(request, response, "/WEB-INF/views/Admin/leave/departmentleavedetails.jsp");
            } else {
                throw e;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request.getSession(false))) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String path = request.getServletPath();
        try {
            switch (path) {
                case "/admin/leave/type":
                    service.addLeaveType(requiredText(request, "leaveType"));
                    redirectWithMessage(request, response, "/admin/leave/type", "Leave type added successfully.", null);
                    break;
                case "/admin/leave/type/delete":
                    service.deleteLeaveType(requiredInt(request, "id"));
                    redirectWithMessage(request, response, "/admin/leave/type", "Leave type deleted successfully.", null);
                    break;
                case "/admin/leave/allocate":
                    service.allocateDepartmentLeave(
                            requiredInt(request, "departmentId"),
                            requiredInt(request, "leaveTypeId"),
                            requiredPositiveInt(request, "numberOfLeaves")
                    );
                    redirectWithMessage(request, response, "/admin/leave/department-details", "Leave allocated successfully.", null);
                    break;
                case "/admin/leave/department/delete":
                    service.deleteDepartmentLeave(requiredInt(request, "id"));
                    redirectWithMessage(request, response, "/admin/leave/department-details", "Leave allocation deleted successfully.", null);
                    break;
                case "/admin/leave/settings/update":
                    service.updateLeaveStatus(
                            requiredInt(request, "leaveTypeId"),
                            "1".equals(request.getParameter("active")),
                            adminName(request)
                    );
                    redirectWithMessage(request, response, "/admin/leave/settings", "Leave settings updated successfully.", null);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (RuntimeException e) {
            String fallback = "/admin/leave/type".equals(path) ? "/admin/leave/type" :
                    "/admin/leave/settings/update".equals(path) ? "/admin/leave/settings" :
                    "/admin/leave/allocate".equals(path) || "/admin/leave/department/delete".equals(path)
                    ? "/admin/leave/department-details" : "/admin/leave/type";
            redirectWithMessage(request, response, fallback, null, rootMessage(e));
        }
    }

    private void loadAllocationPage(HttpServletRequest request) {
        request.setAttribute("departments", service.getDepartmentsForAllocation());
        try {
            request.setAttribute("leaveTypes", service.getActiveLeaveTypes());
        } catch (RuntimeException e) {
            request.setAttribute("leaveTypes", Collections.emptyList());
            request.setAttribute("leaveError", rootMessage(e));
        }
    }

    private void loadAllocationPageSafely(HttpServletRequest request) {
        try {
            request.setAttribute("departments", service.getDepartmentsForAllocation());
        } catch (RuntimeException e) {
            request.setAttribute("departments", Collections.emptyList());
            request.setAttribute("leaveError", rootMessage(e));
        }
        try {
            request.setAttribute("leaveTypes", service.getActiveLeaveTypes());
        } catch (RuntimeException e) {
            request.setAttribute("leaveTypes", Collections.emptyList());
            request.setAttribute("leaveError", rootMessage(e));
        }
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String view)
            throws ServletException, IOException {
        copyFlash(request);
        request.getRequestDispatcher(view).forward(request, response);
    }

    private void redirectWithMessage(HttpServletRequest request, HttpServletResponse response,
                                     String path, String success, String error) throws IOException {
        HttpSession session = request.getSession();
        if (success != null) session.setAttribute("leaveSuccess", success);
        if (error != null) session.setAttribute("leaveError", error);
        response.sendRedirect(request.getContextPath() + path);
    }

    private void copyFlash(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return;
        Object success = session.getAttribute("leaveSuccess");
        Object error = session.getAttribute("leaveError");
        if (success != null) { request.setAttribute("leaveSuccess", success); session.removeAttribute("leaveSuccess"); }
        if (error != null) { request.setAttribute("leaveError", error); session.removeAttribute("leaveError"); }
    }

    private boolean isAdmin(HttpSession session) {
        if (session == null) return false;
        Object role = session.getAttribute("roleName");
        return role != null && "Admin".equalsIgnoreCase(role.toString());
    }

    private String adminName(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Object email = session == null ? null : session.getAttribute("email");
        return email == null ? "Admin" : email.toString();
    }

    private int requiredInt(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        try { return Integer.parseInt(value); }
        catch (Exception e) { throw new IllegalArgumentException(name + " is required and must be a valid number."); }
    }

    private int requiredPositiveInt(HttpServletRequest request, String name) {
        int value = requiredInt(request, name);
        if (value <= 0) throw new IllegalArgumentException(name + " must be greater than zero.");
        return value;
    }

    private int nonNegativeInt(HttpServletRequest request, String name) {
        int value = requiredInt(request, name);
        if (value < 0) throw new IllegalArgumentException(name + " cannot be negative.");
        return value;
    }

    private String requiredText(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        if (value == null || value.trim().isEmpty()) throw new IllegalArgumentException(name + " is required.");
        return value.trim();
    }

    private String rootMessage(Throwable throwable) {
        String message = throwable.getMessage();
        Throwable current = throwable;
        while (current.getCause() != null) {
            current = current.getCause();
            if (current.getMessage() != null && !current.getMessage().trim().isEmpty()) message = current.getMessage();
        }
        if (message == null || message.trim().isEmpty()) return "Unable to process leave request.";
        return message;
    }
}
