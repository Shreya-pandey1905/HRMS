package service.Department;

import models.Employees.Department;

import java.util.List;

public interface DepartmentService {
    boolean addDepartment(Department department);

    List<Department> getAllDepartments();

    Department getDepartmentById(int departmentId);

    boolean updateDepartment(Department department);

    boolean deleteDepartment(int departmentId);
}
