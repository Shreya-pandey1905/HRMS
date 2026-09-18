
        package dao.Department;

import models.Employees.Department;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {

    public boolean addDepartment(Department department) {

        String sql = "{call AddDepartment(?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, department.getName());
            statement.setString(2, department.getStatus());
            statement.setString(3, department.getCreatedBy());

            return statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<Department> getAllDepartments() {

        List<Department> departments = new ArrayList<>();

        String sql = "{call GetAllDepartments()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Department department = new Department();

                department.setDepartmentId(
                        resultSet.getInt("departmentid")
                );

                department.setName(
                        resultSet.getString("name")
                );

                int employeeCount =
                        resultSet.getInt("noofemployee");

                if (resultSet.wasNull()) {
                    department.setNoOfEmployee(null);
                } else {
                    department.setNoOfEmployee(employeeCount);
                }

                department.setStatus(
                        resultSet.getString("status")
                );

                Timestamp createdAt =
                        resultSet.getTimestamp("createdat");

                if (createdAt != null) {
                    department.setCreatedAt(
                            createdAt.toLocalDateTime()
                    );
                }

                department.setCreatedBy(
                        resultSet.getString("createdby")
                );

                department.setModifiedBy(
                        resultSet.getString("modifiedby")
                );

                Timestamp modifiedAt =
                        resultSet.getTimestamp("modifiedat");

                if (modifiedAt != null) {
                    department.setModifiedAt(
                            modifiedAt.toLocalDateTime()
                    );
                }

                departments.add(department);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return departments;
    }

    public Department getDepartmentById(int departmentId) {

        String sql = "{call GetDepartmentById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, departmentId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {

                    Department department = new Department();

                    department.setDepartmentId(
                            resultSet.getInt("departmentid")
                    );

                    department.setName(
                            resultSet.getString("name")
                    );

                    int employeeCount =
                            resultSet.getInt("noofemployee");

                    if (resultSet.wasNull()) {
                        department.setNoOfEmployee(null);
                    } else {
                        department.setNoOfEmployee(employeeCount);
                    }

                    department.setStatus(
                            resultSet.getString("status")
                    );

                    Timestamp createdAt =
                            resultSet.getTimestamp("createdat");

                    if (createdAt != null) {
                        department.setCreatedAt(
                                createdAt.toLocalDateTime()
                        );
                    }

                    department.setCreatedBy(
                            resultSet.getString("createdby")
                    );

                    department.setModifiedBy(
                            resultSet.getString("modifiedby")
                    );

                    Timestamp modifiedAt =
                            resultSet.getTimestamp("modifiedat");

                    if (modifiedAt != null) {
                        department.setModifiedAt(
                                modifiedAt.toLocalDateTime()
                        );
                    }

                    return department;
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean updateDepartment(Department department) {

        String sql = "{call UpdateDepartment(?,?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    department.getDepartmentId()
            );

            statement.setString(
                    2,
                    department.getName()
            );

            statement.setString(
                    3,
                    department.getStatus()
            );

            statement.setString(
                    4,
                    department.getModifiedBy()
            );

            return statement.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteDepartment(int departmentId) {
        String sql = "{call DeleteDepartment(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, departmentId);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }
}

