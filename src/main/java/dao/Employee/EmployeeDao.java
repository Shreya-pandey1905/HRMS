package dao.Employee;

import models.Employees.User;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public boolean addEmployee(User user) {
        String sql = "{call AddEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setString(1,user.getFirstName());
            statement.setString(2,user.getLastName());
            statement.setString(3,user.getEmail());
            statement.setString(4,user.getPasswordHash());
            statement.setString(5,user.getPhoneNumber());
            statement.setInt(6,user.getRoleId());
            setInteger(statement,7,user.getDepartmentId());
            setInteger(statement,8,user.getDesignationId());
            statement.setTimestamp(9,Timestamp.valueOf(user.getDateOfJoining()));
            statement.setTimestamp(10,Timestamp.valueOf(user.getDateOfBirth()));
            statement.setString(11,user.getGender());
            statement.setString(12,user.getAddress());
            statement.setString(13,user.getAboutEmployee());
            statement.setString(14,user.getProfilePicture());
            statement.setString(15,user.getReportingManager());
            statement.setString(16,user.getCreatedBy());
            statement.setString(17,user.getStatus());
            return statement.executeUpdate()>0;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateEmployee(User user) {
        String sql = "{call UpdateEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1,user.getUserId());
            statement.setString(2,user.getFirstName());
            statement.setString(3,user.getLastName());
            statement.setString(4,user.getEmail());
            statement.setString(5,user.getPhoneNumber());
            statement.setInt(6,user.getRoleId());
            setInteger(statement,7,user.getDepartmentId());
            setInteger(statement,8,user.getDesignationId());
            statement.setTimestamp(9,Timestamp.valueOf(user.getDateOfJoining()));
            statement.setTimestamp(10,Timestamp.valueOf(user.getDateOfBirth()));
            statement.setString(11,user.getGender());
            statement.setString(12,user.getAddress());
            statement.setString(13,user.getAboutEmployee());
            statement.setString(14,user.getProfilePicture());
            statement.setString(15,user.getReportingManager());
            statement.setString(16,user.getModifiedBy());
            statement.setString(17,user.getStatus());
            return statement.executeUpdate()>0;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteEmployee(int userId) {
        String sql = "{call DeleteEmployee(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, userId);
            statement.executeUpdate();
            return true;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getEmployeeById(int userId) {
        String sql = "{call GetEmployeeById(?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setInt(1,userId);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) return mapUser(rs);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean emailExists(String email) {
        String sql = "{call CheckEmployeeEmail(?)}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            statement.setString(1,email);
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getManagers() {
        List<User> managers = new ArrayList<>();
        String sql = "{call GetEmployeeManagers()}";
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet rs = statement.executeQuery()) {
            while(rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                managers.add(user);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return managers;
    }

    private User mapUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("UserId"));
        user.setFirstName(rs.getString("FirstName"));
        user.setLastName(rs.getString("LastName"));
        user.setEmail(rs.getString("Email"));
        user.setPasswordHash(rs.getString("PasswordHash"));
        user.setPhoneNumber(rs.getString("PhoneNumber"));
        user.setRoleId(rs.getInt("RoleId"));
        user.setDepartmentId((Integer)rs.getObject("DepartmentId"));
        user.setDesignationId((Integer)rs.getObject("DesignationId"));
        Timestamp joining=rs.getTimestamp("DateOfJoining");
        Timestamp birth=rs.getTimestamp("DateOfBirth");
        if(joining!=null) user.setDateOfJoining(joining.toLocalDateTime());
        if(birth!=null) user.setDateOfBirth(birth.toLocalDateTime());
        user.setGender(rs.getString("Gender"));
        user.setAddress(rs.getString("Address"));
        user.setAboutEmployee(rs.getString("AboutEmployee"));
        user.setProfilePicture(rs.getString("ProfilePicture"));
        user.setReportingManager(rs.getString("ReportingManager"));
        Timestamp created=rs.getTimestamp("CreatedAt");
        Timestamp modified=rs.getTimestamp("ModifiedAt");
        if(created!=null) user.setCreatedAt(created.toLocalDateTime());
        if(modified!=null) user.setModifiedAt(modified.toLocalDateTime());
        user.setCreatedBy(rs.getString("CreatedBy"));
        user.setModifiedBy(rs.getString("ModifiedBy"));
        user.setStatus(rs.getString("Status"));
        return user;
    }

    private void setInteger(CallableStatement statement,int index,Integer value) throws SQLException {
        if(value==null) statement.setNull(index,Types.INTEGER);
        else statement.setInt(index,value);
    }

    public List<User> getAllEmployees() {

        List<User> employees = new ArrayList<>();

        String sql = "{call GetAllEmployees()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setUserId(resultSet.getInt("UserId"));
                user.setFirstName(resultSet.getString("FirstName"));
                user.setLastName(resultSet.getString("LastName"));
                user.setEmail(resultSet.getString("Email"));
                user.setPasswordHash(resultSet.getString("PasswordHash"));
                user.setPhoneNumber(resultSet.getString("PhoneNumber"));
                user.setRoleId(resultSet.getInt("RoleId"));

                int departmentId = resultSet.getInt("DepartmentId");
                user.setDepartmentId(
                        resultSet.wasNull() ? null : departmentId
                );

                int designationId = resultSet.getInt("DesignationId");
                user.setDesignationId(
                        resultSet.wasNull() ? null : designationId
                );

                user.setDateOfJoining(
                        resultSet.getTimestamp("DateOfJoining").toLocalDateTime()
                );

                user.setDateOfBirth(
                        resultSet.getTimestamp("DateOfBirth").toLocalDateTime()
                );

                user.setGender(resultSet.getString("Gender"));
                user.setAddress(resultSet.getString("Address"));
                user.setAboutEmployee(resultSet.getString("AboutEmployee"));
                user.setProfilePicture(resultSet.getString("ProfilePicture"));
                user.setReportingManager(resultSet.getString("ReportingManager"));

                Timestamp createdAt = resultSet.getTimestamp("CreatedAt");
                if (createdAt != null) {
                    user.setCreatedAt(createdAt.toLocalDateTime());
                }

                user.setCreatedBy(resultSet.getString("CreatedBy"));
                user.setModifiedBy(resultSet.getString("ModifiedBy"));

                Timestamp modifiedAt = resultSet.getTimestamp("ModifiedAt");
                if (modifiedAt != null) {
                    user.setModifiedAt(modifiedAt.toLocalDateTime());
                }

                user.setStatus(resultSet.getString("Status"));

                user.setRoleName(resultSet.getString("RoleName"));
                user.setDepartmentName(resultSet.getString("DepartmentName"));
                user.setDesignationName(resultSet.getString("DesignationName"));

                employees.add(user);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public List<User> getRoles() {

        List<User> roles = new ArrayList<>();

        String sql = "{call GetAllActiveRoles()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setRoleId(resultSet.getInt("RoleId"));
                user.setRoleName(resultSet.getString("RoleName"));

                roles.add(user);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return roles;
    }

    public List<User> getDepartments() {

        List<User> departments = new ArrayList<>();

        String sql = "{call GetAllActiveDepartments()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setDepartmentId(
                        resultSet.getInt("DepartmentId")
                );

                user.setDepartmentName(
                        resultSet.getString("DepartmentName")
                );

                departments.add(user);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return departments;
    }

    public List<User> getDesignations() {

        List<User> designations = new ArrayList<>();

        String sql = "{call GetAllActiveDesignations()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                User user = new User();

                user.setDesignationId(
                        resultSet.getInt("DesignationId")
                );

                user.setDesignationName(
                        resultSet.getString("DesignationName")
                );

                user.setDepartmentId(
                        resultSet.getInt("DepartmentId")
                );

                designations.add(user);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return designations;
    }
}