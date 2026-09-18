package serviceImplementer.Manager;

import dao.Manager.ManagerLeaveDao;
import models.Payroll.ManagerLeaveRequest;
import service.Manager.ManagerLeaveService;

import java.sql.Date;
import java.util.List;

public class ManagerLeaveServiceImpl implements ManagerLeaveService {
    private final ManagerLeaveDao dao = new ManagerLeaveDao();

    @Override
    public List<ManagerLeaveRequest> getLeaveRequests(int managerUserId, Date fromDate, Date toDate,
                                                      Integer leaveTypeId, Integer employeeId,
                                                      String status, String sort, String search) {
        return dao.getLeaveRequests(managerUserId, fromDate, toDate, leaveTypeId, employeeId, status, sort, search);
    }

    @Override public List<ManagerLeaveRequest> getEmployeesForFilter(int managerUserId) {
        return dao.getEmployeesForFilter(managerUserId);
    }

    @Override public List<ManagerLeaveRequest> getLeaveTypesForFilter(int managerUserId) {
        return dao.getLeaveTypesForFilter(managerUserId);
    }

    @Override public void updateLeaveStatus(int managerUserId, int leaveRequestId, String action) {
        dao.updateLeaveStatus(managerUserId, leaveRequestId, action);
    }
}
