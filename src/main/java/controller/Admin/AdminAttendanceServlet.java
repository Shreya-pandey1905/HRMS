package controller.Admin;

import dao.Admin.AdminAttendanceDao.AdminAttendanceSummary;
import dao.Department.DepartmentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Employees.Department;
import models.Payroll.AdminAttendanceRecord;
import service.Admin.AdminAttendanceService;
import serviceImplementer.Admin.AdminAttendanceServiceImpl;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;

@WebServlet("/adminAttendance")
public class AdminAttendanceServlet extends HttpServlet {

    private final AdminAttendanceService service = new AdminAttendanceServiceImpl();
    private final DepartmentDao departmentDao = new DepartmentDao();

    private static final DateTimeFormatter DISPLAY_DATE =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request.getSession(false))) {
            redirectToLogin(request, response, "Admin access required. Please login again.");
            return;
        }

        try {
            Integer attendanceId = parseInteger(request.getParameter("attendanceId"));
            LocalDate date = parseDate(request.getParameter("date"));
            LocalDateTime checkIn = parseTime(request.getParameter("checkIn"), date);
            LocalDateTime checkOut = parseTime(request.getParameter("checkOut"), date);
            BigDecimal breakHours = parseBigDecimal(request.getParameter("breakHours"));
            Integer late = parseInteger(request.getParameter("late"));
            BigDecimal productionHours = parseBigDecimal(request.getParameter("productionHours"));
            String status = cleanStatus(request.getParameter("status"));

            if (attendanceId == null || date == null) {
                throw new IllegalArgumentException("Attendance record and date are required.");
            }

            boolean updated = service.updateAttendance(
                    attendanceId,
                    date,
                    checkIn,
                    checkOut,
                    breakHours,
                    late,
                    productionHours,
                    status
            );

            HttpSession session = request.getSession();
            if (updated) {
                session.setAttribute("attendanceSuccess", "Attendance updated successfully.");
            } else {
                session.setAttribute("attendanceError", "Unable to update attendance record.");
            }

            response.sendRedirect(request.getContextPath() + "/adminAttendance");
            return;

        } catch (RuntimeException e) {
            HttpSession session = request.getSession();
            session.setAttribute("attendanceError", rootMessage(e));
            response.sendRedirect(request.getContextPath() + "/adminAttendance");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request.getSession(false))) {
            redirectToLogin(request, response, "Admin access required. Please login again.");
            return;
        }

        LocalDate today = LocalDate.now();

        LocalDate fromDate = parseDate(request.getParameter("fromDate"));
        LocalDate toDate = parseDate(request.getParameter("toDate"));

        String sort = cleanSort(request.getParameter("sort"));
        Integer departmentId = parseInteger(request.getParameter("departmentId"));
        String status = cleanStatus(request.getParameter("status"));

        /*
         * Default page = today.
         * Date presets are used only when the user has not selected
         * a specific date range.
         */
        if (fromDate == null && toDate == null) {

            if ("last7days".equals(sort)) {

                fromDate = today.minusDays(6);
                toDate = today;

            } else if ("lastmonth".equals(sort)) {

                LocalDate firstDayOfLastMonth =
                        today.minusMonths(1).withDayOfMonth(1);

                fromDate = firstDayOfLastMonth;
                toDate = firstDayOfLastMonth
                        .plusMonths(1)
                        .minusDays(1);

            } else {

                fromDate = today;
                toDate = today;
            }

        } else {

            if (fromDate == null) {
                fromDate = toDate;
            }

            if (toDate == null) {
                toDate = fromDate;
            }

            if (fromDate.isAfter(toDate)) {
                LocalDate temp = fromDate;
                fromDate = toDate;
                toDate = temp;
            }
        }

        HttpSession session = request.getSession(false);
        if (session != null) {
            Object successMsg = session.getAttribute("attendanceSuccess");
            if (successMsg != null) {
                request.setAttribute("attendanceSuccess", successMsg);
                session.removeAttribute("attendanceSuccess");
            }

            Object errorMsg = session.getAttribute("attendanceError");
            if (errorMsg != null) {
                request.setAttribute("attendanceError", errorMsg);
                session.removeAttribute("attendanceError");
            }
        }

        List<AdminAttendanceRecord> records;
        AdminAttendanceSummary summary;

        try {

            records = service.findAttendance(
                    fromDate,
                    toDate,
                    departmentId,
                    status,
                    sort
            );

            summary = service.getTodaySummary();

        } catch (RuntimeException e) {

            request.setAttribute(
                    "adminAttendanceError",
                    rootMessage(e)
            );

            records = Collections.emptyList();

            summary = new AdminAttendanceSummary(
                    0,
                    0,
                    0,
                    0,
                    0
            );
        }

        List<Department> departments;

        try {
            departments = departmentDao.getAllDepartments();
        } catch (RuntimeException e) {
            departments = Collections.emptyList();

            if (request.getAttribute("adminAttendanceError") == null) {
                request.setAttribute(
                        "adminAttendanceError",
                        rootMessage(e)
                );
            }
        }

        request.setAttribute(
                "attendanceRecords",
                records
        );

        request.setAttribute(
                "departments",
                departments
        );

        request.setAttribute(
                "summary",
                summary
        );

        request.setAttribute(
                "selectedFromDate",
                fromDate.toString()
        );

        request.setAttribute(
                "selectedToDate",
                toDate.toString()
        );

        request.setAttribute(
                "selectedDateRange",
                fromDate.format(DISPLAY_DATE)
                        + " - "
                        + toDate.format(DISPLAY_DATE)
        );

        request.setAttribute(
                "selectedDepartmentId",
                departmentId == null
                        ? ""
                        : departmentId.toString()
        );

        request.setAttribute(
                "selectedStatus",
                status
        );

        request.setAttribute(
                "selectedSort",
                sort
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/Admin/Addendance/attendanceAdmin.jsp"
        ).forward(request, response);
    }

    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response,
                                String message) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        String contextPath = request.getContextPath();
        String loginUrl = (contextPath == null || contextPath.isEmpty()) ? "/" : contextPath + "/";

        if (message != null && !message.trim().isEmpty()) {
            request.getSession(true).setAttribute("error", message);
        }

        response.sendRedirect(loginUrl);
    }

    private boolean isAdmin(HttpSession session) {

        if (session == null) {
            return false;
        }

        Object role = session.getAttribute("roleName");

        return role != null
                && "Admin".equalsIgnoreCase(role.toString());
    }

    private LocalDate parseDate(String value) {

        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        try {

            return LocalDate.parse(value);

        } catch (DateTimeParseException ignored) {

            return null;
        }
    }

    private Integer parseInteger(String value) {

        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        try {

            return Integer.valueOf(value);

        } catch (NumberFormatException ignored) {

            return null;
        }
    }

    private BigDecimal parseBigDecimal(String value) {

        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        try {
            return new BigDecimal(value.trim());
        } catch (NumberFormatException ignored) {
            return null;
        }
    }

    private LocalDateTime parseTime(String value, LocalDate date) {
        if (value == null || value.trim().isEmpty() || date == null) {
            return null;
        }

        try {
            return LocalDateTime.of(date, LocalTime.parse(value));
        } catch (DateTimeParseException ignored) {
            return null;
        }
    }

    private String cleanStatus(String value) {

        if (value == null
                || value.trim().isEmpty()
                || "all".equalsIgnoreCase(value)) {

            return "";
        }

        if ("present".equalsIgnoreCase(value)) {
            return "Present";
        }

        if ("absent".equalsIgnoreCase(value)) {
            return "Absent";
        }

        if ("permission".equalsIgnoreCase(value)) {
            return "Permission";
        }

        return "";
    }

    private String cleanSort(String value) {

        if ("nameAsc".equalsIgnoreCase(value)) {
            return "nameasc";
        }

        if ("nameDesc".equalsIgnoreCase(value)) {
            return "namedesc";
        }

        if ("lastmonth".equalsIgnoreCase(value)) {
            return "lastmonth";
        }

        if ("last7days".equalsIgnoreCase(value)) {
            return "last7days";
        }

        return "recent";
    }

    private String rootMessage(Throwable throwable) {

        Throwable current = throwable;
        String message = current.getMessage();

        while (current.getCause() != null) {

            current = current.getCause();

            if (current.getMessage() != null
                    && !current.getMessage().trim().isEmpty()) {

                message = current.getMessage();
            }
        }

        if (message == null || message.trim().isEmpty()) {
            return "Unable to load attendance.";
        }

        return message;
    }
}