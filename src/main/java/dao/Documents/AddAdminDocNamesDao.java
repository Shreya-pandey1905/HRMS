package dao.Documents;

import models.Documents.AddAdminDocNames;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddAdminDocNamesDao {

    public List<AddAdminDocNames> getAll() {

        List<AddAdminDocNames> documentNames = new ArrayList<>();

        String sql = "{CALL GetAllAdminDocNames()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                AddAdminDocNames documentName =
                        new AddAdminDocNames();

                documentName.setId(
                        resultSet.getInt("Id")
                );

                documentName.setDocName(
                        resultSet.getString("DocName")
                );

                documentNames.add(documentName);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch admin document names",
                    e
            );
        }

        return documentNames;
    }


    public void add(AddAdminDocNames documentName) {

        String sql = "{CALL AddAdminDocName(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setString(
                    1,
                    documentName.getDocName()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add admin document name",
                    e
            );
        }
    }


    public void update(int id, String docName) {

        String sql = "{CALL UpdateAdminDocName(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, id);
            statement.setString(2, docName);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to update admin document name",
                    e
            );
        }
    }


    public void delete(int id) {

        String sql = "{CALL DeleteAdminDocName(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to delete admin document name",
                    e
            );
        }
    }
}