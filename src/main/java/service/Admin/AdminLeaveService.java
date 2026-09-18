package service.Admin;

import models.Employees.Department;
import models.Payroll.DepartmentLeaves;
import models.Payroll.LeaveSettings;
import models.Payroll.MasterLeaveTypes;

import java.util.List;

public interface AdminLeaveService {
    List<Department> getDepartmentsForAllocation();
    List<MasterLeaveTypes> getLeaveTypes();
    List<MasterLeaveTypes> getActiveLeaveTypes();
    boolean addLeaveType(String leaveType);
    boolean deleteLeaveType(int leaveTypeId);
    List<LeaveSettings> getLeaveSettings();
    boolean updateLeaveStatus(int leaveTypeId, boolean active, String updatedBy);
    List<DepartmentLeaves> getDepartmentLeaveDetails();
    boolean allocateDepartmentLeave(int departmentId, int leaveTypeId, int leavesCount);
    boolean deleteDepartmentLeave(int departmentLeavesId);
}
