package dao.Projects;

import models.Employees.User;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public List<User> getProjectManagers() throws Exception {

        List<User> managers = new ArrayList<>();

        String sql = "{CALL sp_get_project_managers()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("UserId"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));

                managers.add(user);
            }
        }

        return managers;
    }


    public List<User> getProjectEmployees() throws Exception {

        List<User> employees = new ArrayList<>();

        String sql = "{CALL sp_get_project_employees()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("UserId"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));

                employees.add(user);
            }
        }

        return employees;
    }

    public void addProjectEmployee(int projectId, int userId) throws Exception {

        String sql = "{CALL sp_add_project_employee(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, projectId);
            cs.setInt(2, userId);

            cs.execute();

            System.out.println(
                    "Employee " + userId +
                            " assigned to Project " + projectId
            );
        }
    }

    public void deleteProjectEmployees(int projectId) throws Exception {

        String sql = "{CALL sp_delete_project_employees(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, projectId);

            cs.executeUpdate();
        }
    }

    public List<User> getProjectEmployeesByProject(
            int projectId) throws Exception {

        List<User> employees = new ArrayList<>();

        String sql =
                "{CALL sp_get_project_employees_by_project(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, projectId);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    User user = new User();

                    user.setUserId(
                            rs.getInt("UserId")
                    );

                    user.setFirstName(
                            rs.getString("FirstName")
                    );

                    user.setLastName(
                            rs.getString("LastName")
                    );

                    user.setEmail(
                            rs.getString("Email")
                    );

                    employees.add(user);
                }
            }
        }

        return employees;
    }
}