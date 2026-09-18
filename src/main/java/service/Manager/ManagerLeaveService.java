package service.Manager;

import models.Payroll.ManagerLeaveRequest;

import java.sql.Date;
import java.util.List;

public interface ManagerLeaveService {
    List<ManagerLeaveRequest> getLeaveRequests(int managerUserId, Date fromDate, Date toDate,
                                               Integer leaveTypeId, Integer employeeId,
                                               String status, String sort, String search);
    List<ManagerLeaveRequest> getEmployeesForFilter(int managerUserId);
    List<ManagerLeaveRequest> getLeaveTypesForFilter(int managerUserId);
    void updateLeaveStatus(int managerUserId, int leaveRequestId, String action);
}
