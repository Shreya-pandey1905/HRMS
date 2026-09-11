package dao.Documents;

import models.Documents.AdminDocuments;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDocumentsDao {

    public List<AdminDocuments> getAll() {

        List<AdminDocuments> documents =
                new ArrayList<>();

        String sql =
                "{CALL GetAllAdminDocuments()}";

        try (Connection connection =
                     DBConfig.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql);

             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                AdminDocuments document =
                        new AdminDocuments();

                document.setAdminDocId(
                        resultSet.getInt("AdminDocId")
                );

                document.setEmail(
                        resultSet.getString("Email")
                );

                document.setDocName(
                        resultSet.getString("DocName")
                );

                document.setDocFile(
                        resultSet.getString("DocFile")
                );

                document.setEmployeeName(
                        resultSet.getString("EmployeeName")
                );

                documents.add(document);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch admin documents",
                    e
            );
        }

        return documents;
    }


    public void add(AdminDocuments document) {

        String sql =
                "{CALL AddAdminDocument(?, ?, ?)}";

        try (Connection connection =
                     DBConfig.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setString(
                    1,
                    document.getEmail()
            );

            statement.setString(
                    2,
                    document.getDocName()
            );

            statement.setString(
                    3,
                    document.getDocFile()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add admin document",
                    e
            );
        }
    }
    public List<AdminDocuments> getEmployeeCompanyLetters(int userId) {

        List<AdminDocuments> documents = new ArrayList<>();

        String sql = "{CALL GetEmployeeCompanyLetters(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    AdminDocuments document =
                            new AdminDocuments();

                    document.setAdminDocId(
                            resultSet.getInt("AdminDocId")
                    );

                    document.setEmail(
                            resultSet.getString("Email")
                    );

                    document.setDocName(
                            resultSet.getString("DocName")
                    );

                    document.setDocFile(
                            resultSet.getString("DocFile")
                    );

                    document.setEmployeeName(
                            resultSet.getString("EmployeeName")
                    );

                    documents.add(document);
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee company letters",
                    e
            );
        }

        return documents;
    }


    public void delete(int adminDocId) {

        String sql =
                "{CALL DeleteAdminDocument(?)}";

        try (Connection connection =
                     DBConfig.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    adminDocId
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to delete admin document",
                    e
            );
        }
    }
}