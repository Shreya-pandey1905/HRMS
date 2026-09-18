package dao.Employees;

import models.Employees.User;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public List<User> getAllEmployees() {

        List<User> users = new ArrayList<>();

        String sql = "{CALL GetAllEmployees()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setUserId(resultSet.getInt("UserId"));
                user.setFirstName(resultSet.getString("FirstName"));
                user.setLastName(resultSet.getString("LastName"));

                users.add(user);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employees", e);

        }

        return users;
    }
}