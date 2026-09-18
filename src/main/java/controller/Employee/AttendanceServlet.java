package controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Employees.User;
import models.Payroll.Attendance;

import service.Employee.AttendanceService;
import serviceImplementer.Employee.AttendanceServiceImpl;
import dao.Employee.EmployeeDao;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;

@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {

    private final AttendanceService attendanceService =
            new AttendanceServiceImpl();

    private final EmployeeDao employeeDao =
            new EmployeeDao();

    private static final DateTimeFormatter DISPLAY_DATE =
            DateTimeFormatter.ofPattern("dd MMM yyyy");

    private static final DateTimeFormatter DISPLAY_TIME =
            DateTimeFormatter.ofPattern("hh:mm a");


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Integer userId =
                getLoggedInUserId(request.getSession(false));

        if (userId == null) {
            response.sendRedirect(
                    request.getContextPath() + "/index.jsp"
            );
            return;
        }

        LocalDate today = LocalDate.now();

        LocalDate fromDate =
                parseDate(request.getParameter("fromDate"));

        LocalDate toDate =
                parseDate(request.getParameter("toDate"));

        String status =
                cleanFilter(request.getParameter("status"));

        String sort =
                cleanSort(request.getParameter("sort"));


        // -----------------------------------------------------
        // Get today's attendance
        // -----------------------------------------------------

        Attendance todayAttendance =
                attendanceService.getTodayAttendance(
                        userId,
                        today
                );


        // -----------------------------------------------------
        // Get attendance summary
        // -----------------------------------------------------

        AttendanceService.AttendanceSummary summary =
                attendanceService.getSummary(
                        userId,
                        today
                );


        // -----------------------------------------------------
        // Get attendance history
        // -----------------------------------------------------

        List<Attendance> attendanceList =
                attendanceService.getAttendanceHistory(
                        userId,
                        fromDate,
                        toDate,
                        status,
                        sort
                );


        // -----------------------------------------------------
        // Send data to JSP
        // -----------------------------------------------------

        populateView(
                request,
                userId,
                todayAttendance,
                summary,
                attendanceList,
                fromDate,
                toDate,
                status,
                sort
        );


        request.getRequestDispatcher(
                "/WEB-INF/views/Employee/Attendance/attendance.jsp"
        ).forward(request, response);
    }


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        Integer userId =
                getLoggedInUserId(request.getSession(false));

        if (userId == null) {
            response.sendRedirect(
                    request.getContextPath() + "/index.jsp"
            );
            return;
        }


        String action =
                request.getParameter("action");

        LocalDate today =
                LocalDate.now();

        String message = null;
        String error = null;


        try {

            if ("punchIn".equals(action)) {

                attendanceService.checkIn(
                        userId,
                        today
                );

                message =
                        "Check in recorded successfully.";

            }

            else if ("lunchIn".equals(action)) {

                attendanceService.lunchIn(
                        userId,
                        today
                );

                message =
                        "Lunch in recorded successfully.";

            }

            else if ("lunchOut".equals(action)) {

                attendanceService.lunchOut(
                        userId,
                        today
                );

                message =
                        "Lunch out recorded successfully.";

            }

            else if ("checkout".equals(action)) {

                attendanceService.checkOut(
                        userId,
                        today
                );

                message =
                        "Check out recorded successfully.";

            }

            else {

                error =
                        "Invalid attendance action.";
            }

        }

        catch (RuntimeException e) {

            error =
                    rootMessage(e);
        }


        HttpSession session =
                request.getSession();


        if (message != null) {

            session.setAttribute(
                    "attendanceSuccess",
                    message
            );
        }


        if (error != null) {

            session.setAttribute(
                    "attendanceError",
                    error
            );
        }


        response.sendRedirect(
                request.getContextPath() + "/attendance"
        );
    }


    // =========================================================
    // Populate JSP
    // =========================================================

    private void populateView(
            HttpServletRequest request,
            int userId,
            Attendance today,
            AttendanceService.AttendanceSummary summary,
            List<Attendance> list,
            LocalDate fromDate,
            LocalDate toDate,
            String status,
            String sort) {


        User employee =
                employeeDao.getEmployeeById(userId);


        String firstName =
                employee == null ||
                        employee.getFirstName() == null
                        ? "Employee"
                        : employee.getFirstName();


        // -----------------------------------------------------
        // Employee
        // -----------------------------------------------------

        request.setAttribute(
                "employeeGreeting",
                firstName
        );


        request.setAttribute(
                "todayLabel",
                LocalDate.now().format(DISPLAY_DATE)
        );


        // -----------------------------------------------------
        // Attendance state
        // -----------------------------------------------------

        request.setAttribute(
                "attendanceState",
                getState(today)
        );


        request.setAttribute(
                "punchInLabel",
                today == null
                        ? null
                        : formatTime(today.getCheckIn())
        );


        request.setAttribute(
                "lunchInLabel",
                today == null
                        ? null
                        : formatTime(today.getLunchIn())
        );


        request.setAttribute(
                "lunchOutLabel",
                today == null
                        ? null
                        : formatTime(today.getLunchOut())
        );


        request.setAttribute(
                "checkoutLabel",
                today == null
                        ? null
                        : formatTime(today.getCheckOut())
        );


        request.setAttribute(
                "todayStatus",
                today == null
                        ? "Not Checked In"
                        : today.getStatus()
        );


        // -----------------------------------------------------
        // Hours
        // -----------------------------------------------------

        BigDecimal todayWorking =
                summary.getTodayWorkingHours();

        BigDecimal todayProduction =
                summary.getTodayProductionHours();

        BigDecimal todayBreak =
                summary.getTodayBreakHours();

        BigDecimal todayOvertime =
                summary.getTodayOvertimeHours();


        request.setAttribute(
                "todayHours",
                formatHours(todayWorking)
        );


        request.setAttribute(
                "todayProductionHours",
                formatHours(todayProduction)
        );


        request.setAttribute(
                "todayBreakHours",
                formatHours(todayBreak)
        );


        request.setAttribute(
                "todayOvertimeHours",
                formatHours(todayOvertime)
        );


        request.setAttribute(
                "weekHours",
                formatHours(
                        summary.getWeekWorkingHours()
                )
        );


        request.setAttribute(
                "monthHours",
                formatHours(
                        summary.getMonthWorkingHours()
                )
        );


        request.setAttribute(
                "overtimeMonth",
                formatHours(
                        summary.getMonthOvertimeHours()
                )
        );


        // -----------------------------------------------------
        // Progress
        // -----------------------------------------------------

        int targetMinutes =
                9 * 60;

        int workingMinutes =
                toMinutes(todayWorking);

        int productionMinutes =
                toMinutes(todayProduction);

        int breakMinutes =
                toMinutes(todayBreak);


        int totalWorkingProgress =
                Math.min(
                        100,
                        (workingMinutes * 100)
                                / targetMinutes
                );


        int productionProgress =
                workingMinutes == 0
                        ? 0
                        : Math.min(
                        100,
                        (productionMinutes * 100)
                        / workingMinutes
                );


        int breakProgress =
                workingMinutes == 0
                        ? 0
                        : Math.min(
                        100 - productionProgress,
                        (breakMinutes * 100)
                        / workingMinutes
                );


        request.setAttribute(
                "totalWorkingProgress",
                totalWorkingProgress
        );


        request.setAttribute(
                "productiveProgress",
                productionProgress
        );


        request.setAttribute(
                "breakProgress",
                breakProgress
        );


        // -----------------------------------------------------
        // Attendance history
        // -----------------------------------------------------

        request.setAttribute(
                "attendanceList",
                list == null
                        ? Collections.emptyList()
                        : list
        );


        request.setAttribute(
                "selectedFromDate",
                fromDate == null
                        ? ""
                        : fromDate.toString()
        );


        request.setAttribute(
                "selectedToDate",
                toDate == null
                        ? ""
                        : toDate.toString()
        );


        request.setAttribute(
                "selectedDateRange",
                formatDateRange(
                        fromDate,
                        toDate
                )
        );


        request.setAttribute(
                "selectedStatus",
                status == null
                        ? ""
                        : status
        );


        request.setAttribute(
                "selectedSort",
                sort == null
                        ? "newest"
                        : sort
        );


        // -----------------------------------------------------
        // Success / Error messages
        // -----------------------------------------------------

        HttpSession session =
                request.getSession(false);


        if (session != null) {

            request.setAttribute(
                    "attendanceSuccess",
                    session.getAttribute(
                            "attendanceSuccess"
                    )
            );


            request.setAttribute(
                    "attendanceError",
                    session.getAttribute(
                            "attendanceError"
                    )
            );


            session.removeAttribute(
                    "attendanceSuccess"
            );


            session.removeAttribute(
                    "attendanceError"
            );
        }
    }


    // =========================================================
    // Attendance State
    // =========================================================

    private String getState(Attendance attendance) {

        if (attendance == null ||
                attendance.getCheckIn() == null) {

            return "PUNCH_IN";
        }


        if (attendance.getLunchIn() == null) {

            return "LUNCH_IN";
        }


        if (attendance.getLunchOut() == null) {

            return "LUNCH_OUT";
        }


        if (attendance.getCheckOut() == null) {

            return "CHECK_OUT";
        }


        return "COMPLETED";
    }


    // =========================================================
    // Get logged-in user
    // =========================================================

    private Integer getLoggedInUserId(
            HttpSession session) {

        if (session == null) {
            return null;
        }


        Object value =
                session.getAttribute("userId");


        if (value instanceof Integer) {

            return (Integer) value;
        }


        if (value instanceof Number) {

            return ((Number) value).intValue();
        }


        if (value instanceof String) {

            try {

                return Integer.valueOf(
                        (String) value
                );

            }

            catch (NumberFormatException ignored) {

                return null;
            }
        }


        return null;
    }


    // =========================================================
    // Parse Date
    // =========================================================

    private LocalDate parseDate(String value) {

        /*
         * Java 8 compatible replacement for:
         *
         * value.isBlank()
         *
         * Do NOT use String.isBlank() because the project
         * may be compiling with Java 8.
         */

        if (value == null ||
                value.trim().isEmpty()) {

            return null;
        }


        try {

            return LocalDate.parse(value);

        }

        catch (DateTimeParseException ignored) {

            return null;
        }
    }


    // =========================================================
    // Clean Filter
    // =========================================================

    private String cleanFilter(String value) {

        if (value == null ||
                value.trim().isEmpty() ||
                "All Status".equalsIgnoreCase(value)) {

            return "";
        }


        if ("Present".equalsIgnoreCase(value) ||
                "Absent".equalsIgnoreCase(value)) {

            return capitalize(value);
        }


        return "";
    }


    // =========================================================
    // Clean Sort
    // =========================================================

    private String cleanSort(String value) {

        if ("oldest".equalsIgnoreCase(value) ||
                "present".equalsIgnoreCase(value) ||
                "absent".equalsIgnoreCase(value)) {

            return value.toLowerCase();
        }


        return "newest";
    }


    // =========================================================
    // Capitalize
    // =========================================================

    private String capitalize(String value) {

        if (value == null ||
                value.trim().isEmpty()) {

            return "";
        }


        value =
                value.trim();


        return value.substring(0, 1).toUpperCase()
                + value.substring(1).toLowerCase();
    }


    // =========================================================
    // Format Time
    // =========================================================

    private String formatTime(LocalDateTime value) {

        if (value == null) {

            return "-";
        }


        return value.format(DISPLAY_TIME);
    }


    // =========================================================
    // Format Date Range
    // =========================================================

    private String formatDateRange(
            LocalDate from,
            LocalDate to) {

        if (from == null || to == null) {

            return "";
        }


        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern(
                        "dd/MM/yyyy"
                );


        return from.format(formatter)
                + " - "
                + to.format(formatter);
    }


    // =========================================================
    // Format Hours
    // =========================================================

    private String formatHours(BigDecimal value) {

        if (value == null) {

            value = BigDecimal.ZERO;
        }


        long minutes =
                value.multiply(
                                BigDecimal.valueOf(60)
                        )
                        .setScale(
                                0,
                                java.math.RoundingMode.HALF_UP
                        )
                        .longValue();


        return (minutes / 60)
                + "h "
                + (minutes % 60)
                + "m";
    }


    // =========================================================
    // Convert Hours to Minutes
    // =========================================================

    private int toMinutes(BigDecimal value) {

        if (value == null) {

            return 0;
        }


        return value.multiply(
                        BigDecimal.valueOf(60)
                )
                .setScale(
                        0,
                        java.math.RoundingMode.HALF_UP
                )
                .intValue();
    }


    // =========================================================
    // Get Root Exception Message
    // =========================================================

    private String rootMessage(
            Throwable throwable) {

        Throwable current =
                throwable;

        String message =
                current.getMessage();


        while (current.getCause() != null) {

            current =
                    current.getCause();


            if (current.getMessage() != null &&
                    !current.getMessage().trim().isEmpty()) {

                message =
                        current.getMessage();
            }
        }


        if (message == null ||
                message.trim().isEmpty()) {

            return "Attendance operation failed.";
        }


        return message;
    }
}