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
        String sql = "select name,email,department_name,role from users order by id desc";
        List<User> employee = new ArrayList<>();
        try(Connection connection = DatabaseConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User user = new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("department_name"),
                        rs.getString("role")
                );
                employee.add(user);
            }
        }
        return employee;
    }
}
