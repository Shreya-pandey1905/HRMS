package dao.Reports;

import models.Reports.AttendanceReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AttendanceReportDao {

    public List<AttendanceReport> getAll() {

        List<AttendanceReport> attendanceList = new ArrayList<>();

        String sql = "{CALL GetAttendanceReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                AttendanceReport attendance = new AttendanceReport();

                attendance.setAttendanceId(resultSet.getInt("AttendanceId"));
                attendance.setUserId(resultSet.getInt("UserId"));
                attendance.setEmployeeName(resultSet.getString("EmployeeName"));

                Timestamp date = resultSet.getTimestamp("Date");
                if (date != null) {
                    attendance.setDate(date.toLocalDateTime());
                }

                Timestamp checkIn = resultSet.getTimestamp("CheckIn");
                if (checkIn != null) {
                    attendance.setCheckIn(checkIn.toLocalDateTime());
                }

                Timestamp checkOut = resultSet.getTimestamp("CheckOut");
                if (checkOut != null) {
                    attendance.setCheckOut(checkOut.toLocalDateTime());
                }

                Timestamp lunchIn = resultSet.getTimestamp("LunchIn");
                if (lunchIn != null) {
                    attendance.setLunchIn(lunchIn.toLocalDateTime());
                }

                Timestamp lunchOut = resultSet.getTimestamp("LunchOut");
                if (lunchOut != null) {
                    attendance.setLunchOut(lunchOut.toLocalDateTime());
                }

                attendance.setWorkingHours(resultSet.getDouble("WorkingHours"));
                attendance.setProductionHours(resultSet.getDouble("ProductionHours"));
                attendance.setOvertimeHours(resultSet.getDouble("OvertimeHours"));
                attendance.setBreakHours(resultSet.getDouble("BreakHours"));
                attendance.setLate(resultSet.getInt("Late"));
                attendance.setStatus(resultSet.getString("Status"));

                attendanceList.add(attendance);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch attendance report",
                    e
            );
        }

        return attendanceList;
    }
}
