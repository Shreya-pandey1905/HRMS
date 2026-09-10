package service.Employee;

import models.Employees.EmployeeDetails;

public interface EmployeeDetailsService {

    EmployeeDetails getEmployeeDetails(int userId);
}