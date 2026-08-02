package Dao;

import dbConfig.DatabaseConnection;
import model.Leave;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveDao {
    public static boolean addLeave(int user_id, String user_name, String type, Date startDate,Date endDate,String reason) throws SQLException, ClassNotFoundException {
        String sql = "insert into leaves(user_id,user_name,type,start_date,end_date,reason) values(?,?,?,?,?,?)";
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS))
        {
            statement.setInt(1,user_id);
            statement.setString(2,user_name);
            statement.setString(3,type);
            statement.setDate(4,startDate);
            statement.setDate(5,endDate);
            statement.setString(6,reason);

            if(statement.executeUpdate()==1){
                System.out.println("leave added succesfully");
                return true;
            }else{
                System.out.println("sorry !! couldnt added Leave");
                return false;
            }
        }
    }

    public static List<Leave> getAllLeave() throws SQLException, ClassNotFoundException {
        String sql = "select id,user_id,user_name,type,start_date,end_date,reason,status from leaves order by id desc";
        List<Leave> leaves = new ArrayList<>();
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Leave leave = new Leave(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("type"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getString("reason"),
                        rs.getString("status")
                );
                leaves.add(leave);
            }
        }
        return leaves;
    }

    public static boolean updateStatus(int id,String status) throws SQLException, ClassNotFoundException {
        String sql = "update leaves set status = ? where id = ?";
        try(Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS))
        {
            statement.setString(1,status);
            statement.setInt(2,id);
            if(statement.executeUpdate()==1){
                System.out.println("status sets succesfully");
                return true;
            }else{
                System.out.println("sorry !! couldnt update the status");
                return false;
            }
        }
    }
}
