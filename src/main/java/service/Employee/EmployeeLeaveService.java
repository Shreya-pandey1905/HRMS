package service.Employee;

import models.Payroll.EmployeeLeaveBalance;
import models.Payroll.EmployeeLeaveRecord;
import models.Payroll.MasterLeaveTypes;

import java.sql.Date;
import java.util.List;

public interface EmployeeLeaveService {
    List<EmployeeLeaveBalance> getLeaveBalances(int userId);
    List<MasterLeaveTypes> getActiveLeaveTypes();
    List<EmployeeLeaveRecord> getLeaveRequests(int userId, Date fromDate, Date toDate,
                                               Integer leaveTypeId, String status, String sort);
    void applyLeave(int userId, int leaveTypeId, Date startDate, Date endDate, String reason);
}
