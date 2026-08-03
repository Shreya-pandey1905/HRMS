package Dao;

import dbConfig.DatabaseConnection;
import model.User;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public static boolean addEmployee(String name,String email,String department,String hashpass) throws SQLException, ClassNotFoundException {
        String sql = "insert into users(name,email,department_name,password) values(?,?,?,?)";
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS))
        {
            statement.setString(1,name);
            statement.setString(2,email);
            statement.setString(3,department);
            statement.setString(4,hashpass);
            if(statement.executeUpdate()==1){
                System.out.println("employee added succesfully");
                return true;
            }else{
                System.out.println("sorry !! couldnt added employee");
                return false;
            }
        }
    }

    public static List<User> getAllUser() throws SQLException, ClassNotFoundException {
        String sql = "select name,email,password,department_name,role,isupdate from users where role='employee' order by id desc";
        List<User> employee = new ArrayList<>();
        try(Connection connection = DatabaseConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User user = new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("department_name"),
                        rs.getString("role"),
                        rs.getBoolean("isupdate")
                );
                employee.add(user);
            }
        }
        return employee;
    }

    public static User findbyEmailAndPassword(String email, String pass) throws SQLException, ClassNotFoundException {
        String sql="select * from users where email=? and password=?";
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ){
            statement.setString(1,email);
            statement.setString(2,pass);
            try(ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next()? map(resultSet): null;
            }
        }

    }

    public static User findByEmail(String email) throws SQLException, ClassNotFoundException {
        String sql = "select * from users where email = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;
            }
        }
    }

    public  static  User map(ResultSet resultSet) throws SQLException {
        return new User(
                resultSet.getString("name"),
                resultSet.getString("email"),
                resultSet.getString("password"),
                resultSet.getString("department_name"),
                resultSet.getString("role"),
                resultSet.getBoolean("isupdate")

        );
    }
    public static User resetPassword(String email, String pass) throws SQLException{

        String sql = "update users set password = ?, isupdate = true where email = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, pass);
            statement.setString(2, email);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                return UserDao.findByEmail(email);
            }
            return null;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }





}
