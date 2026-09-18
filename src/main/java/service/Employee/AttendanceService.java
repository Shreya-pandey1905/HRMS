package service.Employee;

import models.Payroll.Attendance;

import java.time.LocalDate;
import java.util.List;

public interface AttendanceService {

    Attendance getTodayAttendance(int userId, LocalDate date);

    List<Attendance> getAttendanceHistory(int userId, LocalDate fromDate, LocalDate toDate,
                                          String status, String sort);

    AttendanceSummary getSummary(int userId, LocalDate date);

    void checkIn(int userId, LocalDate date);

    void lunchIn(int userId, LocalDate date);

    void lunchOut(int userId, LocalDate date);

    void checkOut(int userId, LocalDate date);

    class AttendanceSummary {
        private java.math.BigDecimal todayWorkingHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal weekWorkingHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal monthWorkingHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal monthOvertimeHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal todayProductionHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal todayBreakHours = java.math.BigDecimal.ZERO;
        private java.math.BigDecimal todayOvertimeHours = java.math.BigDecimal.ZERO;

        public java.math.BigDecimal getTodayWorkingHours() { return todayWorkingHours; }
        public void setTodayWorkingHours(java.math.BigDecimal value) { this.todayWorkingHours = value; }
        public java.math.BigDecimal getWeekWorkingHours() { return weekWorkingHours; }
        public void setWeekWorkingHours(java.math.BigDecimal value) { this.weekWorkingHours = value; }
        public java.math.BigDecimal getMonthWorkingHours() { return monthWorkingHours; }
        public void setMonthWorkingHours(java.math.BigDecimal value) { this.monthWorkingHours = value; }
        public java.math.BigDecimal getMonthOvertimeHours() { return monthOvertimeHours; }
        public void setMonthOvertimeHours(java.math.BigDecimal value) { this.monthOvertimeHours = value; }
        public java.math.BigDecimal getTodayProductionHours() { return todayProductionHours; }
        public void setTodayProductionHours(java.math.BigDecimal value) { this.todayProductionHours = value; }
        public java.math.BigDecimal getTodayBreakHours() { return todayBreakHours; }
        public void setTodayBreakHours(java.math.BigDecimal value) { this.todayBreakHours = value; }
        public java.math.BigDecimal getTodayOvertimeHours() { return todayOvertimeHours; }
        public void setTodayOvertimeHours(java.math.BigDecimal value) { this.todayOvertimeHours = value; }
    }
}
