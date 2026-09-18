package dao.Employee;

import models.Payroll.Attendance;
import service.Employee.AttendanceService.AttendanceSummary;
import util.DBConfig;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDao {

    public Attendance getTodayAttendance(int userId, LocalDate date) {
        String sql = "{call GetTodayAttendance(?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, userId);
            statement.setDate(2, java.sql.Date.valueOf(date));
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) return mapAttendance(rs);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to fetch today's attendance", e);
        }
        return null;
    }

    public List<Attendance> getAttendanceHistory(int userId, LocalDate fromDate, LocalDate toDate,
                                                 String status, String sort) {
        List<Attendance> result = new ArrayList<>();
        String sql = "{call GetEmployeeAttendanceHistory(?,?,?,?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, userId);
            if (fromDate == null) statement.setNull(2, Types.DATE);
            else statement.setDate(2, java.sql.Date.valueOf(fromDate));
            if (toDate == null) statement.setNull(3, Types.DATE);
            else statement.setDate(3, java.sql.Date.valueOf(toDate));
            statement.setString(4, status == null ? "" : status);
            statement.setString(5, sort == null ? "newest" : sort);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) result.add(mapAttendance(rs));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to fetch attendance history", e);
        }
        return result;
    }

    public AttendanceSummary getSummary(int userId, LocalDate date) {
        AttendanceSummary summary = new AttendanceSummary();
        String sql = "{call GetEmployeeAttendanceSummary(?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, userId);
            statement.setDate(2, java.sql.Date.valueOf(date));
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    summary.setTodayWorkingHours(decimal(rs, "TodayWorkingHours"));
                    summary.setWeekWorkingHours(decimal(rs, "WeekWorkingHours"));
                    summary.setMonthWorkingHours(decimal(rs, "MonthWorkingHours"));
                    summary.setMonthOvertimeHours(decimal(rs, "MonthOvertimeHours"));
                    summary.setTodayProductionHours(decimal(rs, "TodayProductionHours"));
                    summary.setTodayBreakHours(decimal(rs, "TodayBreakHours"));
                    summary.setTodayOvertimeHours(decimal(rs, "TodayOvertimeHours"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to fetch attendance summary", e);
        }
        return summary;
    }

    public void checkIn(int userId, LocalDate date) {
        executePunch("AttendanceCheckIn", userId, date);
    }

    public void lunchIn(int userId, LocalDate date) {
        executePunch("AttendanceLunchIn", userId, date);
    }

    public void lunchOut(int userId, LocalDate date) {
        executePunch("AttendanceLunchOut", userId, date);
    }

    public void checkOut(int userId, LocalDate date) {
        executePunch("AttendanceCheckOut", userId, date);
    }

    private void executePunch(String procedure, int userId, LocalDate date) {
        String sql = "{call " + procedure + "(?,?,?)}";
        LocalDateTime now = LocalDateTime.now();
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, userId);
            statement.setDate(2, java.sql.Date.valueOf(date));
            statement.setTimestamp(3, Timestamp.valueOf(now));
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            String message = e.getMessage() == null ? "Attendance operation failed." : e.getMessage();
            throw new RuntimeException(message, e);
        }
    }

    private Attendance mapAttendance(ResultSet rs) throws SQLException {
        Attendance a = new Attendance();
        a.setAttendanceId(rs.getInt("AttendanceId"));
        a.setUserId(rs.getInt("UserId"));
        a.setDate(toLocalDateTime(rs.getTimestamp("Date")));
        a.setCheckIn(toLocalDateTime(rs.getTimestamp("CheckIn")));
        a.setCheckOut(toLocalDateTime(rs.getTimestamp("CheckOut")));
        a.setLunchIn(toLocalDateTime(rs.getTimestamp("LunchIn")));
        a.setLunchOut(toLocalDateTime(rs.getTimestamp("LunchOut")));
        a.setWorkingHours(decimal(rs, "WorkingHours"));
        a.setProductionHours(decimal(rs, "ProductionHours"));
        a.setOvertimeHours(decimal(rs, "OvertimeHours"));
        a.setBreakHours(decimal(rs, "BreakHours"));
        a.setLate(rs.getInt("Late"));
        a.setStatus(rs.getString("Status"));
        return a;
    }

    private LocalDateTime toLocalDateTime(Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toLocalDateTime();
    }

    private BigDecimal decimal(ResultSet rs, String column) throws SQLException {
        BigDecimal value = rs.getBigDecimal(column);
        return value == null ? BigDecimal.ZERO : value;
    }
}
