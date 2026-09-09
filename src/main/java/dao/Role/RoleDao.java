package dao.Role;

import models.Employees.Role;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoleDao {

    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        String sql = "{call GetAllRoles()}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Role role = new Role();
                role.setRoleId(resultSet.getInt("RoleId"));
                role.setRoleName(resultSet.getString("RoleName"));
                role.setStatus(resultSet.getString("Status"));

                if (resultSet.getTimestamp("CreatedAt") != null) {
                    role.setCreatedAt(
                            resultSet.getTimestamp("CreatedAt").toLocalDateTime()
                    );
                }
                role.setCreatedBy(resultSet.getString("CreatedBy"));
                role.setModifiedBy(resultSet.getString("ModifiedBy"));

                if (resultSet.getTimestamp("ModifiedAt") != null) {
                    role.setModifiedAt(
                            resultSet.getTimestamp("ModifiedAt").toLocalDateTime()
                    );
                }
                roles.add(role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roles;
    }


    public Role getRoleById(int roleId) {
        Role role = null;
        String sql = "{call GetRoleById(?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1, roleId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    role = new Role();
                    role.setRoleId(resultSet.getInt("RoleId"));
                    role.setRoleName(resultSet.getString("RoleName"));
                    role.setStatus(resultSet.getString("Status"));

                    if (resultSet.getTimestamp("CreatedAt") != null) {
                        role.setCreatedAt(
                                resultSet.getTimestamp("CreatedAt").toLocalDateTime()
                        );
                    }

                    role.setCreatedBy(resultSet.getString("CreatedBy"));
                    role.setModifiedBy(resultSet.getString("ModifiedBy"));

                    if (resultSet.getTimestamp("ModifiedAt") != null) {
                        role.setModifiedAt(
                                resultSet.getTimestamp("ModifiedAt").toLocalDateTime()
                        );
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return role;
    }


    public boolean addRole(Role role) {

        String sql = "{call AddRole(?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, role.getRoleName());
            statement.setString(2, role.getStatus());
            statement.setString(3, role.getCreatedBy());

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean updateRole(Role role) {

        String sql = "{call UpdateRole(?,?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, role.getRoleId());
            statement.setString(2, role.getRoleName());
            statement.setString(3, role.getStatus());
            statement.setString(4, role.getModifiedBy());

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean deleteRole(int roleId) {

        String sql = "{call DeleteRole(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, roleId);

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}