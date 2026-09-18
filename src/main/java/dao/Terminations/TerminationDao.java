package dao.Terminations;

import models.Terminations.Termination;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TerminationDao {

    // ADD TERMINATION
    public void addTermination(Termination termination) {

        String sql = "{CALL AddTermination(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(1, termination.getUserId());
            statement.setString(2, termination.getTerminationType());
            statement.setTimestamp(3, Timestamp.valueOf(termination.getNoticeDate()));
            statement.setTimestamp(4, Timestamp.valueOf(termination.getResignDate()));
            statement.setString(5, termination.getReason());

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException("Unable to add termination", e);
        }
    }

    // GET ALL TERMINATIONS
    public List<Termination> getAllTerminations() {

        List<Termination> terminations = new ArrayList<>();

        String sql = "{CALL GetAllTerminations()}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Termination termination = new Termination();

                termination.setTerminationId(resultSet.getInt("TerminationId"));
                termination.setUserId(resultSet.getInt("UserID"));
                termination.setTerminationType(resultSet.getString("TerminationType"));
                termination.setNoticeDate(resultSet.getTimestamp("NoticeDate").toLocalDateTime());
                termination.setResignDate(resultSet.getTimestamp("ResignDate").toLocalDateTime());
                termination.setReason(resultSet.getString("Reason"));
                termination.setFirstName(resultSet.getString("FirstName"));
                termination.setLastName(resultSet.getString("LastName"));
                termination.setDepartment(resultSet.getString("Department"));

                terminations.add(termination);
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to get terminations", e);
        }

        return terminations;
    }

    // GET TERMINATION BY ID
    public Termination getTerminationById(int terminationId) {

        String sql = "{CALL GetTerminationById(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(1, terminationId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Termination termination = new Termination();

                    termination.setTerminationId(resultSet.getInt("TerminationId"));
                    termination.setUserId(resultSet.getInt("UserID"));
                    termination.setTerminationType(resultSet.getString("TerminationType"));
                    termination.setNoticeDate(resultSet.getTimestamp("NoticeDate").toLocalDateTime());
                    termination.setResignDate(resultSet.getTimestamp("ResignDate").toLocalDateTime());
                    termination.setReason(resultSet.getString("Reason"));

                    return termination;
                }
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to get termination", e);
        }

        return null;
    }

    // UPDATE TERMINATION
    public void updateTermination(Termination termination) {

        String sql = "{CALL UpdateTermination(?, ?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(1, termination.getTerminationId());
            statement.setInt(2, termination.getUserId());
            statement.setString(3, termination.getTerminationType());
            statement.setTimestamp(4, Timestamp.valueOf(termination.getNoticeDate()));
            statement.setTimestamp(5, Timestamp.valueOf(termination.getResignDate()));
            statement.setString(6, termination.getReason());

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException("Unable to update termination", e);
        }
    }

    // DELETE TERMINATION
    public void deleteTermination(int terminationId) {

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall("{CALL DeleteTermination(?)}")
        ) {

            statement.setInt(1, terminationId);
            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Unable to delete termination", e);
        }
    }
}
