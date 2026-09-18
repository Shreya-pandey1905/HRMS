package dao.Admin;

import models.Employees.Department;
import models.Payroll.DepartmentLeaves;
import models.Payroll.LeaveSettings;
import models.Payroll.MasterLeaveTypes;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminLeaveDao {

    public List<Department> getDepartmentsForAllocation() {
        List<Department> result = new ArrayList<>();
           String sql = "{call GetAllDepartments()}";
        try (Connection c = DBConfig.getConnection();
               CallableStatement s = c.prepareCall(sql);
             ResultSet rs = s.executeQuery()) {
            while (rs.next()) {
                Department department = new Department();
                department.setDepartmentId(rs.getInt("DepartmentId"));
                department.setName(rs.getString("Name"));
                department.setStatus(rs.getString("Status"));
                result.add(department);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load departments for leave allocation.", e);
        }
        return result;
    }

    public List<MasterLeaveTypes> getLeaveTypes() {
        List<MasterLeaveTypes> result = new ArrayList<>();
        String sql = "{call GetLeaveTypes()}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql); ResultSet rs = s.executeQuery()) {
            while (rs.next()) {
                MasterLeaveTypes type = new MasterLeaveTypes();
                type.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                type.setLeaveType(rs.getString("LeaveType"));
                type.setActive(rs.getBoolean("IsActive"));
                result.add(type);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load leave types.", e);
        }
        return result;
    }

    public List<MasterLeaveTypes> getActiveLeaveTypes() {
        List<MasterLeaveTypes> result = new ArrayList<>();
        String sql = "{call GetActiveLeaveTypes()}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql); ResultSet rs = s.executeQuery()) {
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

    public boolean addLeaveType(String leaveType) {
        String sql = "{call AddLeaveType(?)}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql)) {
            s.setString(1, leaveType);
            s.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to add leave type.", e);
        }
    }

    public boolean deleteLeaveType(int leaveTypeId) {
        String sql = "{call DeleteLeaveType(?)}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, leaveTypeId);
            s.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to delete leave type.", e);
        }
    }

    public List<LeaveSettings> getLeaveSettings() {
        List<LeaveSettings> result = new ArrayList<>();
        String sql = "{call GetLeaveSettings()}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql); ResultSet rs = s.executeQuery()) {
            while (rs.next()) result.add(mapSetting(rs));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load leave settings.", e);
        }
        return result;
    }

    public boolean updateLeaveStatus(int leaveTypeId, boolean active, String updatedBy) {
        String sql = "{call UpdateLeaveStatus(?,?,?)}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, leaveTypeId);
            s.setBoolean(2, active);
            s.setString(3, updatedBy);
            s.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to update leave setting.", e);
        }
    }

    public List<DepartmentLeaves> getDepartmentLeaveDetails() {
        List<DepartmentLeaves> result = new ArrayList<>();
        String sql = "{call GetDepartmentLeaveDetails()}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql); ResultSet rs = s.executeQuery()) {
            while (rs.next()) {
                DepartmentLeaves leave = new DepartmentLeaves();
                leave.setDepartmentLeavesId(rs.getInt("DepartmentLeavesId"));
                leave.setDepartmentId(rs.getInt("DepartmentId"));
                leave.setDepartmentName(rs.getString("DepartmentName"));
                leave.setLeaveTypeId(rs.getInt("LeaveTypeId"));
                leave.setLeaveTypeName(rs.getString("LeaveType"));
                leave.setLeavesCount(rs.getInt("LeavesCount"));
                leave.setStatus(rs.getString("Status"));
                result.add(leave);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to load department leave details.", e);
        }
        return result;
    }

    public boolean allocateDepartmentLeave(int departmentId, int leaveTypeId, int leavesCount) {
        String sql = "{call AllocateDepartmentLeave(?,?,?)}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, departmentId);
            s.setInt(2, leaveTypeId);
            s.setInt(3, leavesCount);
            s.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to allocate department leave.", e);
        }
    }

    public boolean deleteDepartmentLeave(int departmentLeavesId) {
        String sql = "{call DeleteDepartmentLeave(?)}";
        try (Connection c = DBConfig.getConnection(); CallableStatement s = c.prepareCall(sql)) {
            s.setInt(1, departmentLeavesId);
            s.execute();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Unable to delete department leave allocation.", e);
        }
    }

    private LeaveSettings mapSetting(ResultSet rs) throws SQLException {
        LeaveSettings setting = new LeaveSettings();
        setting.setLeaveSettingId((Integer) rs.getObject("LeaveSettingId"));
        setting.setLeaveTypeId(rs.getInt("LeaveTypeId"));
        setting.setLeaveType(rs.getString("LeaveType"));
        setting.setActive(rs.getBoolean("IsActive"));
        setting.setDefaultLeaves(rs.getInt("DefaultLeaves"));
        setting.setAllowCarryForward(rs.getBoolean("AllowCarryForward"));
        setting.setMaxCarryForward(rs.getInt("MaxCarryForward"));
        setting.setEarnedLeave(rs.getBoolean("IsEarnedLeave"));
        setting.setUpdatedBy(rs.getString("UpdatedBy"));
        Timestamp updatedAt = rs.getTimestamp("UpdatedAt");
        setting.setUpdatedAt(updatedAt == null ? null : updatedAt.toLocalDateTime());
        return setting;
    }
}
