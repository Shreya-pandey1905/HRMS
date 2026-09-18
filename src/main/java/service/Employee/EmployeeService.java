package service.Employee;

import models.Employees.User;
import java.util.List;

public interface EmployeeService {
    boolean addEmployee(User user);
    boolean updateEmployee(User user);
    boolean deleteEmployee(int userId);
    User getEmployeeById(int userId);
    List<User> getAllEmployees();
    boolean emailExists(String email);
    List<User> getManagers();
    List<User> getRoles();

    List<User> getDepartments();

    List<User> getDesignations();
}