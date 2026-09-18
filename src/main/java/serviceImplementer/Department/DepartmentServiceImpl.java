package serviceImplementer.Department;

import dao.Department.DepartmentDao;
import models.Employees.Department;
import service.Department.DepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements DepartmentService {

    private final DepartmentDao departmentDao = new DepartmentDao();

    @Override
    public boolean addDepartment(Department department) {
        return departmentDao.addDepartment(department);
    }

    @Override
    public List<Department> getAllDepartments() {
        return departmentDao.getAllDepartments();
    }

    @Override
    public Department getDepartmentById(int departmentId) {
        return departmentDao.getDepartmentById(departmentId);
    }

    @Override
    public boolean updateDepartment(Department department) {
        return departmentDao.updateDepartment(department);
    }

    @Override
    public boolean deleteDepartment(int departmentId) {
        return departmentDao.deleteDepartment(departmentId);
    }
}