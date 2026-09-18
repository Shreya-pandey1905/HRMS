package dao.Reports;

import models.Reports.DailyReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DailyReportDao {

    public List<DailyReport> getAll() {

        List<DailyReport> dailyList = new ArrayList<>();

        String sql = "{CALL GetDailyReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                DailyReport daily = new DailyReport();

                daily.setAttendanceId(resultSet.getInt("AttendanceId"));
                daily.setEmployeeName(resultSet.getString("EmployeeName"));

                Timestamp date = resultSet.getTimestamp("Date");
                if (date != null) {
                    daily.setDate(date.toLocalDateTime());
                }

                daily.setDepartmentName(resultSet.getString("DepartmentName"));
                daily.setStatus(resultSet.getString("Status"));

                dailyList.add(daily);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch daily report",
                    e
            );
        }

        return dailyList;
    }
}
