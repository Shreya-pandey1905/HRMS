package dao.Admin;

import models.Payroll.AdminAttendanceRecord;
import util.DBConfig;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AdminAttendanceDao {

    public List<AdminAttendanceRecord> findAttendance(LocalDate fromDate, LocalDate toDate,
                                                       Integer departmentId, String status, String sort) {
        List<AdminAttendanceRecord> records = new ArrayList<>();
        String sql = "{call GetAdminAttendance(?,?,?,?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            setDate(statement, 1, fromDate);
            setDate(statement, 2, toDate);
            if (departmentId == null) statement.setNull(3, Types.INTEGER);
            else statement.setInt(3, departmentId);
            statement.setString(4, status == null ? "" : status);
            statement.setString(5, sort == null ? "recent" : sort);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) records.add(map(rs));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to fetch admin attendance", e);
        }
        return records;
    }

    public boolean updateAttendance(Integer attendanceId,
                                   LocalDate date,
                                   LocalDateTime checkIn,
                                   LocalDateTime checkOut,
                                   BigDecimal breakHours,
                                   Integer late,
                                   BigDecimal productionHours,
                                   String status) {
        if (attendanceId == null || date == null) {
            throw new IllegalArgumentException("Attendance record and date are required.");
        }

        String sql = "UPDATE Attendance SET Date = ?, CheckIn = ?, CheckOut = ?, BreakHours = ?, Late = ?, ProductionHours = ?, Status = ? WHERE AttendanceId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(date));
            if (checkIn == null) statement.setNull(2, Types.TIMESTAMP); else statement.setTimestamp(2, Timestamp.valueOf(checkIn));
            if (checkOut == null) statement.setNull(3, Types.TIMESTAMP); else statement.setTimestamp(3, Timestamp.valueOf(checkOut));
            if (breakHours == null) statement.setNull(4, Types.DECIMAL); else statement.setBigDecimal(4, breakHours);
            if (late == null) statement.setNull(5, Types.INTEGER); else statement.setInt(5, late);
            if (productionHours == null) statement.setNull(6, Types.DECIMAL); else statement.setBigDecimal(6, productionHours);
            statement.setString(7, status == null ? "Present" : status.trim());
            statement.setInt(8, attendanceId);

            return statement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to update attendance record.", e);
        }
    }

    public AdminAttendanceSummary getTodaySummary() {
        String sql = "{call GetAdminAttendanceTodaySummary(?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return new AdminAttendanceSummary(
                            rs.getInt("TotalEmployees"),
                            rs.getInt("PresentCount"),
                            rs.getInt("LateCount"),
                            rs.getInt("PermissionCount"),
                            rs.getInt("AbsentCount")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to fetch attendance summary", e);
        }
        return new AdminAttendanceSummary(0, 0, 0, 0, 0);
    }

    private void setDate(CallableStatement statement, int index, LocalDate value) throws SQLException {
        if (value == null) statement.setNull(index, Types.DATE);
        else statement.setDate(index, java.sql.Date.valueOf(value));
    }

    private AdminAttendanceRecord map(ResultSet rs) throws SQLException {
        AdminAttendanceRecord r = new AdminAttendanceRecord();
        r.setAttendanceId((Integer) rs.getObject("AttendanceId"));
        r.setUserId(rs.getInt("UserId"));
        r.setFirstName(rs.getString("FirstName"));
        r.setLastName(rs.getString("LastName"));
        r.setDepartmentName(rs.getString("DepartmentName"));
        r.setProfilePicture(rs.getString("ProfilePicture"));
        r.setDate(toLocalDateTime(rs.getTimestamp("AttendanceDate")));
        r.setCheckIn(toLocalDateTime(rs.getTimestamp("CheckIn")));
        r.setCheckOut(toLocalDateTime(rs.getTimestamp("CheckOut")));
        r.setBreakHours(rs.getBigDecimal("BreakHours"));
        r.setLate((Integer) rs.getObject("Late"));
        r.setProductionHours(rs.getBigDecimal("ProductionHours"));
        r.setWorkingHours(rs.getBigDecimal("WorkingHours"));
        r.setOvertimeHours(rs.getBigDecimal("OvertimeHours"));
        r.setStatus(rs.getString("AttendanceStatus"));
        return r;
    }

    private java.time.LocalDateTime toLocalDateTime(java.sql.Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toLocalDateTime();
    }

    public static class AdminAttendanceSummary {
        private final int totalEmployees, presentCount, lateCount, permissionCount, absentCount;
        public AdminAttendanceSummary(int totalEmployees, int presentCount, int lateCount,
                                      int permissionCount, int absentCount) {
            this.totalEmployees = totalEmployees;
            this.presentCount = presentCount;
            this.lateCount = lateCount;
            this.permissionCount = permissionCount;
            this.absentCount = absentCount;
        }
        public int getTotalEmployees() { return totalEmployees; }
        public int getPresentCount() { return presentCount; }
        public int getLateCount() { return lateCount; }
        public int getPermissionCount() { return permissionCount; }
        public int getUninformedCount() { return 0; }
        public int getAbsentCount() { return absentCount; }
    }
}
