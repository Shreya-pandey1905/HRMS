package dao.Role;

import models.Employees.Role;
import util.DBConfig;

import java.sql.*;

public class RoleDao {

    public Role getRoleById(int roleId) {

        Role role = null;

        String sql = "{CALL GetRoleById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, roleId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                role = new Role();
                role.setRoleId(rs.getInt("RoleId"));
                role.setRoleName(rs.getString("RoleName"));
                role.setStatus(rs.getString("Status"));
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch role", e);
        }

        return role;
    }
}