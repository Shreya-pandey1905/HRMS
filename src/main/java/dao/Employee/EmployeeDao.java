package dao.Employee;

import models.Employees.User;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public List<User> getAll() {

        List<User> employees = new ArrayList<>();

        String sql = "{CALL GetAllEmployees()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User employee = new User();

                employee.setUserId(resultSet.getInt("UserId"));
                employee.setFirstName(resultSet.getString("FirstName"));
                employee.setLastName(resultSet.getString("LastName"));
                employee.setEmail(resultSet.getString("Email"));

                employees.add(employee);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employees",
                    e
            );
        }

        return employees;
    }
}