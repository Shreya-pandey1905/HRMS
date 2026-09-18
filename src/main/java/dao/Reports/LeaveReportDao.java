package dao.Reports;

import models.Reports.LeaveReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class LeaveReportDao {

    public List<LeaveReport> getAll() {

        List<LeaveReport> leaveList = new ArrayList<>();

        String sql = "{CALL GetLeaveReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                LeaveReport leave = new LeaveReport();

                leave.setLeaveRequestId(resultSet.getInt("LeaveRequestId"));
                leave.setUserId(resultSet.getInt("UserId"));
                leave.setEmployeeName(resultSet.getString("EmployeeName"));
                leave.setLeaveTypeId(resultSet.getInt("LeaveTypeId"));
                leave.setLeaveType(resultSet.getString("LeaveType"));

                Timestamp startDate = resultSet.getTimestamp("StartDate");
                if (startDate != null) {
                    leave.setStartDate(startDate.toLocalDateTime());
                }

                Timestamp endDate = resultSet.getTimestamp("EndDate");
                if (endDate != null) {
                    leave.setEndDate(endDate.toLocalDateTime());
                }

                leave.setNumberOfDays(resultSet.getInt("NumberOfDays"));
                leave.setReason(resultSet.getString("Reason"));
                leave.setApprovedBy(resultSet.getString("ApprovedBy"));
                leave.setStatus(resultSet.getString("Status"));
                leave.setStatusHistory(resultSet.getString("StatusHistory"));

                leaveList.add(leave);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch leave report",
                    e
            );
        }

        return leaveList;
    }
}
