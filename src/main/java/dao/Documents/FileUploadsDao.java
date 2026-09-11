package dao.Documents;

import models.Documents.FileUploads;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FileUploadsDao {


    // =========================================================
    // ADMIN - GET ALL EMPLOYEE DOCUMENTS
    // =========================================================

    public List<FileUploads> getAll() {

        List<FileUploads> files = new ArrayList<>();

        String sql = "{CALL GetAllEmployeeDocuments()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                FileUploads file = new FileUploads();

                file.setId(
                        resultSet.getInt("id")
                );

                file.setFileName(
                        resultSet.getString("FileName")
                );

                file.setFilePath(
                        resultSet.getString("FilePath")
                );

                file.setUserId(
                        resultSet.getInt("UserId")
                );

                file.setDocumentId(
                        resultSet.getInt("DocumentId")
                );

                file.setDocumentName(
                        resultSet.getString("DocName")
                );

                String firstName =
                        resultSet.getString("FirstName");

                String lastName =
                        resultSet.getString("LastName");

                file.setEmployeeName(
                        ((firstName == null ? "" : firstName) + " "
                                + (lastName == null ? "" : lastName))
                                .trim()
                );

                file.setEmployeeEmail(
                        resultSet.getString("Email")
                );

                files.add(file);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee documents",
                    e
            );
        }

        return files;
    }


    // =========================================================
    // EMPLOYEE - GET OWN DOCUMENTS
    // =========================================================

    public List<FileUploads> getEmployeeDocuments(int userId) {

        List<FileUploads> files = new ArrayList<>();

        String sql = "{CALL GetEmployeeDocuments(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    FileUploads file = new FileUploads();

                    file.setId(
                            resultSet.getInt("id")
                    );

                    file.setFileName(
                            resultSet.getString("FileName")
                    );

                    file.setFilePath(
                            resultSet.getString("FilePath")
                    );

                    file.setUserId(
                            resultSet.getInt("UserId")
                    );

                    file.setDocumentId(
                            resultSet.getInt("DocumentId")
                    );

                    file.setDocumentName(
                            resultSet.getString("DocName")
                    );

                    files.add(file);
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee documents",
                    e
            );
        }

        return files;
    }


    // =========================================================
    // ADD EMPLOYEE DOCUMENT
    // =========================================================

    public void add(FileUploads file) {

        String sql =
                "{CALL AddEmployeeDocument(?, ?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setString(
                    1,
                    file.getFileName()
            );

            statement.setString(
                    2,
                    file.getFilePath()
            );

            statement.setInt(
                    3,
                    file.getUserId()
            );

            statement.setInt(
                    4,
                    file.getDocumentId()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to save employee document",
                    e
            );
        }
    }


    // =========================================================
    // DELETE EMPLOYEE DOCUMENT
    // =========================================================

    public void delete(int id) {

        String sql =
                "{CALL DeleteEmployeeDocument(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to delete employee document",
                    e
            );
        }
    }


    // =========================================================
    // ASSIGN DOCUMENT
    // =========================================================

    public void assignDocument(int userId,
                               int documentId) {

        String sql =
                "{CALL AssignEmployeeDocument(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);
            statement.setInt(2, documentId);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to assign employee document",
                    e
            );
        }
    }


    // =========================================================
    // PENDING DOCUMENTS
    // =========================================================

    public List<FileUploads> getPendingDocuments(int userId) {

        List<FileUploads> pendingDocuments =
                new ArrayList<>();

        String sql =
                "{CALL GetPendingEmployeeDocuments(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    FileUploads file =
                            new FileUploads();

                    file.setUserId(
                            resultSet.getInt("UserId")
                    );

                    file.setDocumentId(
                            resultSet.getInt("DocumentId")
                    );

                    file.setFileName(
                            resultSet.getString("DocName")
                    );

                    pendingDocuments.add(file);
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch pending documents",
                    e
            );
        }

        return pendingDocuments;
    }


    // =========================================================
    // MARK DOCUMENT SUBMITTED
    // =========================================================

    public void markDocumentSubmitted(int userId,
                                      int documentId) {

        String sql =
                "{CALL MarkEmployeeDocumentSubmitted(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);
            statement.setInt(2, documentId);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to update document status",
                    e
            );
        }
    }
}