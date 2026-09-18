package dao.Manager;

import models.Payroll.ManagerLeaveRequest;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManagerLeaveDao {

    public List<ManagerLeaveRequest> getLeaveRequests(int managerUserId, Date fromDate, Date toDate,
                                                       Integer leaveTypeId, Integer employeeId,
                                                       String status, String sort, String search) {
        List<ManagerLeaveRequest> result = new ArrayList<>();
        String sql = "{call GetManagerLeaveRequests(?,?,?,?,?,?,?,?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, managerUserId);
            if (fromDate == null) s.setNull(2, java.sql.Types.DATE); else s.setDate(2, fromDate);
            if (toDate == null) s.setNull(3, java.sql.Types.DATE); else s.setDate(3, toDate);
            if (leaveTypeId == null) s.setNull(4, java.sql.Types.INTEGER); else s.setInt(4, leaveTypeId);
            if (employeeId == null) s.setNull(5, java.sql.Types.INTEGER); else s.setInt(5, employeeId);
            s.setString(6, status == null ? "" : status);
            s.setString(7, sort == null ? "recent" : sort);
            s.setString(8, search == null ? "" : search.trim());
            try (ResultSet rs = s.executeQuery()) {
                while (rs.next()) {
                    ManagerLeaveRequest r = new ManagerLeaveRequest();
                    r.setLeaveRequestId(rs.getInt("LeaveRequestId"));
                    r.setUserId(rs.getInt("UserId"));
                    r.setEmployeeName(rs.getString("EmployeeName"));
                    r.setEmployeeEmail(rs.getString("EmployeeEmail"));
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
            throw new RuntimeException("Unable to load manager leave requests.", e);
        }
        return result;
    }

    public List<ManagerLeaveRequest> getEmployeesForFilter(int managerUserId) {
        List<ManagerLeaveRequest> result = new ArrayList<>();
        String sql = "{call GetManagerLeaveEmployees(?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, managerUserId);
            try (ResultSet rs = s.executeQuery()) {
                while (rs.next()) {
                    ManagerLeaveRequest r = new ManagerLeaveRequest();
                    r.setUserId(rs.getInt("UserId"));
                    r.setEmployeeName(rs.getString("EmployeeName"));
                    r.setEmployeeEmail(rs.getString("EmployeeEmail"));
                    result.add(r);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load manager employees.", e);
        }
        return result;
    }

    public List<ManagerLeaveRequest> getLeaveTypesForFilter(int managerUserId) {
        List<ManagerLeaveRequest> result = new ArrayList<>();
        String sql = "{call GetManagerLeaveTypes(?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, managerUserId);
            try (ResultSet rs = s.executeQuery()) {
                while (rs.next()) {
                    ManagerLeaveRequest r = new ManagerLeaveRequest();
                    r.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                    r.setLeaveType(rs.getString("LeaveType"));
                    result.add(r);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load manager leave types.", e);
        }
        return result;
    }

    public void updateLeaveStatus(int managerUserId, int leaveRequestId, String action) {
        String sql = "{call ManagerUpdateLeaveStatus(?,?,?)}";
        try (Connection c = DBConfig.getConnection();
             CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, managerUserId);
            s.setInt(2, leaveRequestId);
            s.setString(3, action);
            s.execute();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to update leave request.", e);
        }
    }
}
