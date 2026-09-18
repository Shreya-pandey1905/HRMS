package dao.Employee;

import models.Payroll.EmployeeLeaveBalance;
import models.Payroll.EmployeeLeaveRecord;
import models.Payroll.MasterLeaveTypes;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class EmployeeLeaveDao {

    public List<EmployeeLeaveBalance> getLeaveBalances(int userId) {
        List<EmployeeLeaveBalance> result = new ArrayList<>();
        String sql = "SELECT m.LeaveTypeId, m.LeaveType, "
            + "COALESCE(b.TotalLeaves, dl.LeavesCount, 0) AS TotalLeaves, "
            + "COALESCE(b.UsedLeaves, 0) AS UsedLeaves, "
            + "GREATEST(COALESCE(b.TotalLeaves, dl.LeavesCount, 0) - COALESCE(b.UsedLeaves, 0), 0) AS RemainingLeaves "
            + "FROM `User` u "
            + "INNER JOIN DepartmentLeaves dl ON dl.DepartmentId = u.DepartmentId "
            + "AND LOWER(COALESCE(dl.Status, 'Active')) = 'active' "
            + "INNER JOIN MasterLeaveTypes m ON m.LeaveTypeId = dl.LeaveTypeId "
            + "LEFT JOIN LeaveBalances b ON b.UserId = u.UserId "
            + "AND b.DepartmentLeavesId = dl.DepartmentLeavesId "
            + "AND b.LeaveTypeId = dl.LeaveTypeId "
            + "WHERE u.UserId = ? "
            + "AND LOWER(COALESCE(u.Status, 'Active')) = 'active' "
            + "ORDER BY m.LeaveType ASC, m.LeaveTypeId ASC";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, userId);
            try (ResultSet rs = s.executeQuery()) {
                while (rs.next()) {
                    EmployeeLeaveBalance b = new EmployeeLeaveBalance();
                    b.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                    b.setLeaveType(rs.getString("LeaveType"));
                    b.setTotalLeaves(rs.getInt("TotalLeaves"));
                    b.setUsedLeaves(rs.getInt("UsedLeaves"));
                    b.setRemainingLeaves(rs.getInt("RemainingLeaves"));
                    result.add(b);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load employee leave balances.", e);
        }
        return result;
    }

    public List<EmployeeLeaveRecord> getLeaveRequests(int userId, Date fromDate, Date toDate,
                                                      Integer leaveTypeId, String status, String sort) {
        List<EmployeeLeaveRecord> result = new ArrayList<>();
        String sql = "{call GetEmployeeLeaveRequests(?,?,?,?,?,?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, userId);
            if (fromDate == null) s.setNull(2, java.sql.Types.DATE); else s.setDate(2, fromDate);
            if (toDate == null) s.setNull(3, java.sql.Types.DATE); else s.setDate(3, toDate);
            if (leaveTypeId == null) s.setNull(4, java.sql.Types.INTEGER); else s.setInt(4, leaveTypeId);
            s.setString(5, status == null ? "" : status);
            s.setString(6, sort == null ? "newest" : sort);
            try (ResultSet rs = s.executeQuery()) {
                while (rs.next()) {
                    EmployeeLeaveRecord r = new EmployeeLeaveRecord();
                    r.setLeaveRequestId(rs.getInt("LeaveRequestId"));
                    r.setUserId(rs.getInt("UserId"));
                    r.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                    r.setLeaveType(rs.getString("LeaveType"));
                    Timestamp start = rs.getTimestamp("StartDate");
                    Timestamp end = rs.getTimestamp("EndDate");
                    r.setStartDate(start == null ? null : start.toLocalDateTime());
                    r.setEndDate(end == null ? null : end.toLocalDateTime());
                    r.setNumberOfDays(rs.getInt("NumberOfDays"));
                    r.setReason(rs.getString("Reason"));
                    r.setApprovedBy(rs.getString("ApprovedBy"));
                    r.setStatus(rs.getString("Status"));
                    r.setStatusHistory(rs.getString("StatusHistory"));
                    result.add(r);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load employee leave requests.", e);
        }
        return result;
    }

    public List<MasterLeaveTypes> getActiveLeaveTypes() {
        List<MasterLeaveTypes> result = new ArrayList<>();
        String sql = "{call GetActiveLeaveTypes()}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql);
             ResultSet rs = s.executeQuery()) {
            while (rs.next()) {
                MasterLeaveTypes type = new MasterLeaveTypes();
                type.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                type.setLeaveType(rs.getString("LeaveType"));
                result.add(type);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load active leave types.", e);
        }
        return result;
    }

    public void applyLeave(int userId, int leaveTypeId, Date startDate, Date endDate, String reason) {
        String sql = "{call ApplyEmployeeLeave(?,?,?,?,?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, userId);
            s.setInt(2, leaveTypeId);
            s.setDate(3, startDate);
            s.setDate(4, endDate);
            s.setString(5, reason);
            s.execute();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to apply for leave.", e);
        }
    }
}
