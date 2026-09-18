package controller.DashboardController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Payroll.ManagerLeaveRequest;
import service.Manager.ManagerLeaveService;
import serviceImplementer.Manager.ManagerLeaveServiceImpl;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;

@WebServlet(urlPatterns = {"/manager/leave", "/manager/leave/approval"})
public class ManagerLeaveServlet extends HttpServlet {
    private final ManagerLeaveService service = new ManagerLeaveServiceImpl();
    private static final DateTimeFormatter DISPLAY_DATE = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer managerUserId = getUserId(session);
        if (!isManager(session, managerUserId)) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        LocalDate from = parseDate(request.getParameter("fromDate"));
        LocalDate to = parseDate(request.getParameter("toDate"));
        if (from != null && to != null && from.isAfter(to)) {
            LocalDate temp = from; from = to; to = temp;
        }

        Integer leaveTypeId = parsePositiveInt(request.getParameter("leaveTypeId"));
        Integer employeeId = parsePositiveInt(request.getParameter("employeeId"));
        String status = cleanStatus(request.getParameter("status"));
        String sort = cleanSort(request.getParameter("sort"));
        String search = request.getParameter("search");
        if (search == null) search = "";
        search = search.trim();
        if (search.length() > 100) search = search.substring(0, 100);

        List<ManagerLeaveRequest> records = Collections.emptyList();
        List<ManagerLeaveRequest> employees = Collections.emptyList();
        List<ManagerLeaveRequest> leaveTypes = Collections.emptyList();
        try {
            records = service.getLeaveRequests(managerUserId,
                    from == null ? null : Date.valueOf(from),
                    to == null ? null : Date.valueOf(to),
                    leaveTypeId, employeeId, status, sort, search);
            employees = service.getEmployeesForFilter(managerUserId);
            leaveTypes = service.getLeaveTypesForFilter(managerUserId);
        } catch (RuntimeException e) {
            request.setAttribute("leaveError", rootMessage(e));
        }

        int pending = 0, approved = 0, rejected = 0;
        for (ManagerLeaveRequest r : records) {
            if (r.isActionable()) pending++;
            else if ("Approved".equalsIgnoreCase(r.getStatus())) approved++;
            else if ("Rejected".equalsIgnoreCase(r.getStatus()) || "Declined".equalsIgnoreCase(r.getStatus())) rejected++;
        }

        request.setAttribute("leaveRecords", records);
        request.setAttribute("managerEmployees", employees);
        request.setAttribute("managerLeaveTypes", leaveTypes);
        request.setAttribute("pendingCount", pending);
        request.setAttribute("approvedCount", approved);
        request.setAttribute("rejectedCount", rejected);
        request.setAttribute("selectedFromDate", from == null ? "" : from.toString());
        request.setAttribute("selectedToDate", to == null ? "" : to.toString());
        request.setAttribute("selectedDateRange", from == null && to == null ? "" :
                (from == null ? to : from).format(DISPLAY_DATE) + " - " + (to == null ? from : to).format(DISPLAY_DATE));
        request.setAttribute("selectedLeaveTypeId", leaveTypeId == null ? "" : leaveTypeId.toString());
        request.setAttribute("selectedEmployeeId", employeeId == null ? "" : employeeId.toString());
        request.setAttribute("selectedStatus", status);
        request.setAttribute("selectedSort", sort);
        request.setAttribute("selectedSearch", search);
        copyFlash(request);

        request.getRequestDispatcher("/WEB-INF/views/Manager/leave/leaveapproval.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Integer managerUserId = getUserId(session);
        if (!isManager(session, managerUserId)) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        try {
            int requestId = requiredPositiveInt(request, "leaveRequestId");
            String action = request.getParameter("action");
            if (!"approve".equalsIgnoreCase(action) && !"reject".equalsIgnoreCase(action)) {
                throw new IllegalArgumentException("Invalid leave action.");
            }
            service.updateLeaveStatus(managerUserId, requestId, action.toLowerCase());
            session.setAttribute("leaveSuccess", "Leave request " + ("approve".equalsIgnoreCase(action) ? "approved" : "rejected") + " successfully.");
        } catch (RuntimeException e) {
            session.setAttribute("leaveError", rootMessage(e));
        }

        String redirect = request.getContextPath() + "/manager/leave";
        String query = buildQuery(request);
        response.sendRedirect(redirect + query);
    }

    private String buildQuery(HttpServletRequest request) {
        StringBuilder q = new StringBuilder("?");
        append(q, "fromDate", request.getParameter("fromDate"));
        append(q, "toDate", request.getParameter("toDate"));
        append(q, "leaveTypeId", request.getParameter("leaveTypeId"));
        append(q, "employeeId", request.getParameter("employeeId"));
        append(q, "status", request.getParameter("status"));
        append(q, "sort", request.getParameter("sort"));
        append(q, "search", request.getParameter("search"));
        return q.length() == 1 ? "" : q.substring(0, q.length() - 1);
    }

    private void append(StringBuilder q, String name, String value) {
        if (value == null || value.trim().isEmpty()) return;
        try {
            q.append(name).append('=').append(java.net.URLEncoder.encode(value, "UTF-8")).append('&');
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException("UTF-8 encoding is not available", e);
        }
    }

    private boolean isManager(HttpSession session, Integer userId) {
        if (session == null || userId == null) return false;
        Object role = session.getAttribute("roleName");
        return role != null && "Manager".equalsIgnoreCase(role.toString());
    }

    private Integer getUserId(HttpSession session) {
        if (session == null) return null;
        Object value = session.getAttribute("userId");
        if (value instanceof Number) return ((Number) value).intValue();
        if (value instanceof String) try { return Integer.valueOf((String) value); } catch (NumberFormatException ignored) { }
        return null;
    }

    private LocalDate parseDate(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        try { return LocalDate.parse(value.trim()); } catch (DateTimeParseException e) { return null; }
    }

    private Integer parsePositiveInt(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        try { int i = Integer.parseInt(value); return i > 0 ? i : null; } catch (NumberFormatException e) { return null; }
    }

    private int requiredPositiveInt(HttpServletRequest request, String name) {
        Integer value = parsePositiveInt(request.getParameter(name));
        if (value == null) throw new IllegalArgumentException(name + " is required and must be a valid number.");
        return value;
    }

    private String cleanStatus(String value) {
        if (value == null || value.trim().isEmpty() || "All Status".equalsIgnoreCase(value)) return "";
        if ("New".equalsIgnoreCase(value)) return "New";
        if ("Pending".equalsIgnoreCase(value)) return "Pending";
        if ("Approved".equalsIgnoreCase(value)) return "Approved";
        if ("Rejected".equalsIgnoreCase(value) || "Declined".equalsIgnoreCase(value)) return "Rejected";
        return "";
    }

    private String cleanSort(String value) {
        if ("asc".equalsIgnoreCase(value)) return "asc";
        if ("desc".equalsIgnoreCase(value)) return "desc";
        return "recent";
    }

    private void copyFlash(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return;
        Object success = session.getAttribute("leaveSuccess");
        Object error = session.getAttribute("leaveError");
        if (success != null) { request.setAttribute("leaveSuccess", success); session.removeAttribute("leaveSuccess"); }
        if (error != null) { request.setAttribute("leaveError", error); session.removeAttribute("leaveError"); }
    }

    private String rootMessage(Throwable throwable) {
        String message = throwable.getMessage();
        Throwable current = throwable;
        while (current.getCause() != null) {
            current = current.getCause();
            if (current.getMessage() != null && !current.getMessage().trim().isEmpty()) message = current.getMessage();
        }
        return message == null || message.trim().isEmpty() ? "Unable to process leave request." : message;
    }
}
