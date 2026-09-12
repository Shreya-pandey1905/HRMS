package serviceImplementer.Employee;

import dao.Employee.EmployeeDao;
import models.Employees.User;
import service.Employee.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeDao employeeDao=new EmployeeDao();

    @Override
    public boolean addEmployee(User user) {
        if(employeeDao.emailExists(user.getEmail())) return false;
        return employeeDao.addEmployee(user);
    }

    @Override
    public boolean updateEmployee(User user) {
        return employeeDao.updateEmployee(user);
    }

    @Override
    public boolean deleteEmployee(int userId) {
        return employeeDao.deleteEmployee(userId);
    }

    @Override
    public User getEmployeeById(int userId) {
        return employeeDao.getEmployeeById(userId);
    }

    @Override
    public List<User> getAllEmployees() {
        return employeeDao.getAllEmployees();
    }

    @Override
    public boolean emailExists(String email) {
        return employeeDao.emailExists(email);
    }

    @Override
    public List<User> getManagers() {
        return employeeDao.getManagers();
    }

    @Override
    public List<User> getRoles() {
        return employeeDao.getRoles();
    }

    @Override
    public List<User> getDepartments() {
        return employeeDao.getDepartments();
    }

    @Override
    public List<User> getDesignations() {
        return employeeDao.getDesignations();
    }
}