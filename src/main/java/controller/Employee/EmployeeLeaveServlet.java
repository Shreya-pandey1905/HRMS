package controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Payroll.EmployeeLeaveBalance;
import models.Payroll.EmployeeLeaveRecord;
import models.Payroll.MasterLeaveTypes;
import service.Employee.EmployeeLeaveService;
import serviceImplementer.Employee.EmployeeLeaveServiceImpl;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;

@WebServlet(urlPatterns = {"/employee/leave", "/employee/leave/apply", "/emploee/applyleave"})
public class EmployeeLeaveServlet extends HttpServlet {
    private final EmployeeLeaveService service = new EmployeeLeaveServiceImpl();
    private static final DateTimeFormatter DISPLAY_DATE = DateTimeFormatter.ofPattern("dd MMM yyyy");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = getLoggedInUserId(request.getSession(false));
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        try {
            LocalDate from = parseDate(request.getParameter("fromDate"));
            LocalDate to = parseDate(request.getParameter("toDate"));
            if (from != null && to != null && from.isAfter(to)) {
                LocalDate temp = from; from = to; to = temp;
            }
            Integer leaveTypeId = parsePositiveInt(request.getParameter("leaveTypeId"));
            String status = cleanStatus(request.getParameter("status"));
            String sort = cleanSort(request.getParameter("sort"));

            List<EmployeeLeaveBalance> balances = service.getLeaveBalances(userId);
            List<EmployeeLeaveRecord> records = service.getLeaveRequests(
                    userId,
                    from == null ? null : Date.valueOf(from),
                    to == null ? null : Date.valueOf(to),
                    leaveTypeId,
                    status,
                    sort
            );
            List<MasterLeaveTypes> leaveTypes = service.getActiveLeaveTypes();

            populate(request, balances, records, leaveTypes, from, to, leaveTypeId, status, sort);
            copyFlash(request);
            request.getRequestDispatcher("/WEB-INF/views/Employee/leave/applyleave.jsp").forward(request, response);
        } catch (RuntimeException e) {
            request.setAttribute("leaveError", rootMessage(e));
            request.setAttribute("leaveBalances", Collections.emptyList());
            request.setAttribute("leaveRecords", Collections.emptyList());
            request.setAttribute("leaveTypes", Collections.emptyList());
            copyFlash(request);
            request.getRequestDispatcher("/WEB-INF/views/Employee/leave/applyleave.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getLoggedInUserId(request.getSession(false));
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        try {
            int leaveTypeId = requiredPositiveInt(request, "leaveTypeId");
            LocalDate from = requiredDate(request, "fromDate");
            LocalDate to = requiredDate(request, "toDate");
            String reason = requiredText(request, "reason");
            service.applyLeave(userId, leaveTypeId, Date.valueOf(from), Date.valueOf(to), reason);
            request.getSession().setAttribute("leaveSuccess", "Leave request submitted successfully.");
        } catch (RuntimeException e) {
            request.getSession().setAttribute("leaveError", rootMessage(e));
        }
        response.sendRedirect(request.getContextPath() + "/employee/leave");
    }

    private void populate(HttpServletRequest request, List<EmployeeLeaveBalance> balances,
                          List<EmployeeLeaveRecord> records, List<MasterLeaveTypes> leaveTypes,
                          LocalDate from, LocalDate to, Integer leaveTypeId, String status, String sort) {
        int total = 0, used = 0, remaining = 0;
        for (EmployeeLeaveBalance b : balances) {
            total += safe(b.getTotalLeaves());
            used += safe(b.getUsedLeaves());
            remaining += safe(b.getRemainingLeaves());
        }
        request.setAttribute("leaveBalances", balances == null ? Collections.emptyList() : balances);
        request.setAttribute("leaveRecords", records == null ? Collections.emptyList() : records);
        request.setAttribute("leaveTypes", leaveTypes == null ? Collections.emptyList() : leaveTypes);
        request.setAttribute("totalLeaves", total);
        request.setAttribute("totalUsedLeaves", used);
        request.setAttribute("totalRemainingLeaves", remaining);
        request.setAttribute("selectedFromDate", from == null ? "" : from.toString());
        request.setAttribute("selectedToDate", to == null ? "" : to.toString());
        request.setAttribute("selectedLeaveTypeId", leaveTypeId == null ? "" : leaveTypeId.toString());
        request.setAttribute("selectedStatus", status == null ? "" : status);
        request.setAttribute("selectedSort", sort);
    }

    private Integer getLoggedInUserId(HttpSession session) {
        if (session == null) return null;
        Object value = session.getAttribute("userId");
        if (value instanceof Number) return ((Number) value).intValue();
        if (value instanceof String) {
            try { return Integer.valueOf((String) value); } catch (NumberFormatException ignored) { }
        }
        return null;
    }

    private LocalDate parseDate(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        try { return LocalDate.parse(value.trim()); }
        catch (DateTimeParseException e) { return null; }
    }

    private LocalDate requiredDate(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        LocalDate date = parseDate(value);
        if (date == null) throw new IllegalArgumentException(name + " is required and must be a valid date.");
        return date;
    }

    private Integer parsePositiveInt(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        try { int i = Integer.parseInt(value); return i > 0 ? i : null; }
        catch (NumberFormatException e) { return null; }
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
        if ("Declined".equalsIgnoreCase(value) || "Rejected".equalsIgnoreCase(value)) return "Declined";
        return "";
    }

    private String cleanSort(String value) {
        return "oldest".equalsIgnoreCase(value) ? "oldest" : "newest";
    }

    private String requiredText(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        if (value == null || value.trim().isEmpty()) throw new IllegalArgumentException(name + " is required.");
        return value.trim();
    }

    private int safe(Integer value) { return value == null ? 0 : value; }

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
