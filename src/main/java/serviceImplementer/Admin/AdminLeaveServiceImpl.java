package serviceImplementer.Admin;

import dao.Admin.AdminLeaveDao;
import models.Employees.Department;
import models.Payroll.DepartmentLeaves;
import models.Payroll.LeaveSettings;
import models.Payroll.MasterLeaveTypes;
import service.Admin.AdminLeaveService;

import java.util.List;

public class AdminLeaveServiceImpl implements AdminLeaveService {
    private final AdminLeaveDao dao = new AdminLeaveDao();

    @Override public List<Department> getDepartmentsForAllocation() { return dao.getDepartmentsForAllocation(); }
    @Override public List<MasterLeaveTypes> getLeaveTypes() { return dao.getLeaveTypes(); }
    @Override public List<MasterLeaveTypes> getActiveLeaveTypes() { return dao.getActiveLeaveTypes(); }
    @Override public boolean addLeaveType(String leaveType) { return dao.addLeaveType(leaveType); }
    @Override public boolean deleteLeaveType(int leaveTypeId) { return dao.deleteLeaveType(leaveTypeId); }
    @Override public List<LeaveSettings> getLeaveSettings() { return dao.getLeaveSettings(); }
    @Override public boolean updateLeaveStatus(int leaveTypeId, boolean active, String updatedBy) {
        return dao.updateLeaveStatus(leaveTypeId, active, updatedBy);
    }
    @Override public List<DepartmentLeaves> getDepartmentLeaveDetails() { return dao.getDepartmentLeaveDetails(); }
    @Override public boolean allocateDepartmentLeave(int departmentId, int leaveTypeId, int leavesCount) {
        return dao.allocateDepartmentLeave(departmentId, leaveTypeId, leavesCount);
    }
    @Override public boolean deleteDepartmentLeave(int departmentLeavesId) { return dao.deleteDepartmentLeave(departmentLeavesId); }
}
