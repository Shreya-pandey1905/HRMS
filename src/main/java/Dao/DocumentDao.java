package Dao;


import dbConfig.DatabaseConnection;
import model.Document;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DocumentDao {

      public static boolean addDocument(Document document) throws SQLException, ClassNotFoundException {
        String sql = "insert into documents(user_id,file_name,content_type,file_size,file_data) values (?,?,?,?,?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement =connection.prepareStatement(sql)) {
            statement.setInt(1, document.getUserId());
            statement.setString(2, document.getFileName());
            statement.setString(3, document.getContentType());
            statement.setLong(4, document.getFileSize());
            statement.setBytes(5, document.getFileData());

             statement.executeUpdate();
            return true;
       }
    }



    public static List<Document> findByuserId(int user_id) throws SQLException, ClassNotFoundException {
        List<Document> documents = new ArrayList<>();

        String sql = "select * from documents where user_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, user_id);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    documents.add(map(resultSet));
                }
            }
        }
        return documents;
    }


    public static Document findById(int id) throws SQLException, ClassNotFoundException {

        String sql="select * from documents where id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement =connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try(ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next()? map(resultSet): null;
            }
        }

    }


    private static Document map(ResultSet resultSet) throws SQLException {

        Document document = new Document();
        document.setId(resultSet.getInt("id"));
        document.setUserId(resultSet.getInt("user_id"));
        document.setFileName(resultSet.getString("file_name"));
        document.setContentType(resultSet.getString("content_type"));
        document.setFileSize(resultSet.getLong("file_size"));
        document.setFileData(resultSet.getBytes("file_data"));
        document.setUploadedAt(resultSet.getTimestamp("uploaded_at"));
        return document;
    }

    public static int getUserIdByEmail(String email) throws SQLException, ClassNotFoundException {

        String sql = "select id from users where email = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
               if (resultSet.next()) {
                    return resultSet.getInt("id");
                }
                return 0;
            }
        }
    }
}