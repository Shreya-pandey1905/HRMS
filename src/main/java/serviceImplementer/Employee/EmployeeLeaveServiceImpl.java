package serviceImplementer.Employee;

import dao.Employee.EmployeeLeaveDao;
import models.Payroll.EmployeeLeaveBalance;
import models.Payroll.EmployeeLeaveRecord;
import models.Payroll.MasterLeaveTypes;
import service.Employee.EmployeeLeaveService;

import java.sql.Date;
import java.util.List;

public class EmployeeLeaveServiceImpl implements EmployeeLeaveService {
    private final EmployeeLeaveDao dao = new EmployeeLeaveDao();

    @Override public List<EmployeeLeaveBalance> getLeaveBalances(int userId) { return dao.getLeaveBalances(userId); }
    @Override public List<MasterLeaveTypes> getActiveLeaveTypes() { return dao.getActiveLeaveTypes(); }
    @Override public List<EmployeeLeaveRecord> getLeaveRequests(int userId, Date fromDate, Date toDate,
                                                                Integer leaveTypeId, String status, String sort) {
        return dao.getLeaveRequests(userId, fromDate, toDate, leaveTypeId, status, sort);
    }
    @Override public void applyLeave(int userId, int leaveTypeId, Date startDate, Date endDate, String reason) {
        dao.applyLeave(userId, leaveTypeId, startDate, endDate, reason);
    }
}
