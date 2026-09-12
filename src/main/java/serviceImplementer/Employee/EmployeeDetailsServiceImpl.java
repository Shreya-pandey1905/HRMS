package serviceImplementer.Employee;

import dao.Employee.EmployeeDetailsDao;
import models.Employees.EmployeeDetails;
import service.Employee.EmployeeDetailsService;

public class EmployeeDetailsServiceImpl implements EmployeeDetailsService {

    private EmployeeDetailsDao employeeDetailsDao;

    public EmployeeDetailsServiceImpl() {
        employeeDetailsDao = new EmployeeDetailsDao();
    }

    @Override
    public EmployeeDetails getEmployeeDetails(int userId) {
        return employeeDetailsDao.getEmployeeDetails(userId);
    }
}