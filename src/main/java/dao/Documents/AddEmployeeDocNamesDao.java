package dao.Documents;

import models.Documents.AddEmployeeDocNames;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddEmployeeDocNamesDao {

    public List<AddEmployeeDocNames> getAll() {

        List<AddEmployeeDocNames> documentNames = new ArrayList<>();

        String sql = "{CALL GetAllEmployeeDocNames()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                AddEmployeeDocNames documentName =
                        new AddEmployeeDocNames();

                documentName.setId(resultSet.getInt("Id"));
                documentName.setDocName(resultSet.getString("DocName"));

                documentNames.add(documentName);
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to fetch employee document names",
                    e
            );
        }

        return documentNames;
    }

    public void add(AddEmployeeDocNames documentName) {

        String sql = "{CALL AddEmployeeDocName(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(
                    1,
                    documentName.getDocName()
            );

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to add employee document name",
                    e
            );
        }
    }

    public void delete(int id) {

        String sql = "{CALL DeleteEmployeeDocName(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to delete employee document name",
                    e
            );
        }
    }
}