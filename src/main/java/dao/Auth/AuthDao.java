package dao.Auth;

import models.AuthUser.Users;
import util.DBConfig;

import java.sql.*;

public class AuthDao {

    public Users getUserByEmail(String email) {

        Users authUser = null;

        String sql = "{call GetUserByEmail(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                authUser = new Users();
                authUser.setUserId(rs.getInt("UserId"));
                authUser.setEmail(rs.getString("Email"));
                authUser.setPasswordHash(rs.getString("PasswordHash"));
                authUser.setRoleId(rs.getInt("RoleId"));
                authUser.setStatus(rs.getString("Status"));
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch user", e);
        }

        return authUser;
    }
}