

package dao.Resignations;

import models.Resignations.Resignation;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ResignationDao {

    // ADD RESIGNATION
    public void addResignation(Resignation resignation) {

        String sql = "{CALL AddResignation(?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(
                    1,
                    resignation.getUserId()
            );

            statement.setTimestamp(
                    2,
                    Timestamp.valueOf(
                            resignation.getNoticeDate()
                    )
            );

            statement.setString(
                    3,
                    resignation.getReason()
            );

            statement.setTimestamp(
                    4,
                    Timestamp.valueOf(
                            resignation.getResignDate()
                    )
            );

            statement.execute();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add resignation",
                    e
            );
        }
    }

    // GET ALL RESIGNATIONS
    public List<Resignation> getAllResignations() {

        List<Resignation> resignations = new ArrayList<>();

        String sql = "{CALL GetAllResignations()}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Resignation resignation = new Resignation();

                resignation.setResignationId(
                        resultSet.getInt("ResignationId")
                );

                resignation.setUserId(
                        resultSet.getInt("UserID")
                );

                resignation.setDepartmentId(
                        resultSet.getInt("DepartmentId")
                );

                resignation.setFirstName(
                        resultSet.getString("FirstName")
                );

                resignation.setLastName(
                        resultSet.getString("LastName")
                );

                resignation.setDepartment(
                        resultSet.getString("Department")
                );

                resignation.setNoticeDate(
                        resultSet.getTimestamp("NoticeDate")
                                .toLocalDateTime()
                );

                resignation.setReason(
                        resultSet.getString("Reason")
                );

                resignation.setResignDate(
                        resultSet.getTimestamp("ResignDate")
                                .toLocalDateTime()
                );

                resignations.add(resignation);
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to get resignations", e);
        }

        return resignations;
    }

    public Resignation getResignationById(int resignationId) {

        String sql = "{CALL GetResignationById(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(1, resignationId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Resignation resignation = new Resignation();

                    resignation.setResignationId(
                            resultSet.getInt("ResignationId")
                    );

                    resignation.setUserId(
                            resultSet.getInt("UserID")
                    );

                    resignation.setDepartmentId(
                            resultSet.getInt("DepartmentId")
                    );

                    resignation.setNoticeDate(
                            resultSet.getTimestamp("NoticeDate")
                                    .toLocalDateTime()
                    );

                    resignation.setReason(
                            resultSet.getString("Reason")
                    );

                    resignation.setResignDate(
                            resultSet.getTimestamp("ResignDate")
                                    .toLocalDateTime()
                    );

                    return resignation;
                }
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to get resignation", e);
        }

        return null;
    }

    public void updateResignation(Resignation resignation) {

        String sql = "{CALL UpdateResignation(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(
                    1,
                    resignation.getResignationId()
            );

            statement.setInt(
                    2,
                    resignation.getUserId()
            );

            statement.setTimestamp(
                    3,
                    Timestamp.valueOf(
                            resignation.getNoticeDate()
                    )
            );

            statement.setString(
                    4,
                    resignation.getReason()
            );

            statement.setTimestamp(
                    5,
                    Timestamp.valueOf(
                            resignation.getResignDate()
                    )
            );

            statement.execute();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to update resignation",
                    e
            );
        }
    }

    public void deleteResignation(int resignationId) {

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall("{CALL DeleteResignation(?)}")
        ) {

            statement.setInt(1, resignationId);
            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Unable to delete resignation", e);
        }
    }
}
