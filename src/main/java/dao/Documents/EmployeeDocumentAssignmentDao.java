package dao.Documents;

import models.Documents.EmployeeDocumentAssignment;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDocumentAssignmentDao {

    public List<EmployeeDocumentAssignment> getAll() {

        List<EmployeeDocumentAssignment> assignments =
                new ArrayList<>();

        String sql = "{CALL GetAllEmployeeDocumentAssignments()}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql);
                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                EmployeeDocumentAssignment assignment =
                        new EmployeeDocumentAssignment();

                assignment.setAssignmentId(
                        resultSet.getInt("AssignmentId")
                );

                assignment.setUserId(
                        resultSet.getInt("UserId")
                );

                assignment.setDocumentId(
                        resultSet.getInt("DocumentId")
                );

                assignment.setEmployeeName(
                        resultSet.getString("EmployeeName")
                );

                assignment.setDocumentName(
                        resultSet.getString("DocumentName")
                );

                assignments.add(assignment);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee document assignments",
                    e
            );
        }

        return assignments;
    }
}