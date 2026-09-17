package dao.Trainers;

import models.Trainers.Training;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainingDao {

    // =========================================================
    // GET ALL TRAININGS
    // =========================================================

    public List<Training> getAllTrainings() {

        List<Training> trainings = new ArrayList<>();

        String sql =
                "SELECT t.TrainingId, " +
                        "t.TrainerId, " +
                        "t.TrainingTypeId, " +
                        "t.UserId, " +
                        "t.TrainingCost, " +
                        "t.Description, " +
                        "t.Status, " +
                        "t.StartDate, " +
                        "t.EndDate, " +
                        "t.CreatedAt, " +
                        "t.CreatedBy, " +
                        "t.ModifiedBy, " +
                        "t.ModifiedAt, " +

                        "tr.FirstName AS TrainerFirstName, " +
                        "tr.LastName AS TrainerLastName, " +

                        "tt.TrainingTypeName AS TrainingTypeName, " +

                        "u.FirstName AS UserFirstName, " +
                        "u.LastName AS UserLastName " +

                        "FROM Training t " +

                        "LEFT JOIN Trainer tr " +
                        "ON t.TrainerId = tr.TrainerId " +

                        "LEFT JOIN TrainingType tt " +
                        "ON t.TrainingTypeId = tt.TrainingTypeId " +

                        "LEFT JOIN `User` u " +
                        "ON t.UserId = u.UserId";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {

                Training training = new Training();

                training.setTrainingId(
                        rs.getInt("TrainingId")
                );

                training.setTrainerId(
                        rs.getInt("TrainerId")
                );

                training.setTrainingTypeId(
                        rs.getInt("TrainingTypeId")
                );

                training.setUserId(
                        rs.getInt("UserId")
                );

                training.setTrainingCost(
                        rs.getDouble("TrainingCost")
                );

                training.setDescription(
                        rs.getString("Description")
                );

                training.setStatus(
                        rs.getString("Status")
                );

                Timestamp startDate =
                        rs.getTimestamp("StartDate");

                if (startDate != null) {

                    training.setStartDate(
                            startDate.toLocalDateTime()
                    );
                }

                Timestamp endDate =
                        rs.getTimestamp("EndDate");

                if (endDate != null) {

                    training.setEndDate(
                            endDate.toLocalDateTime()
                    );
                }

                Timestamp createdAt =
                        rs.getTimestamp("CreatedAt");

                if (createdAt != null) {

                    training.setCreatedAt(
                            createdAt.toLocalDateTime()
                    );
                }

                training.setCreatedBy(
                        rs.getString("CreatedBy")
                );

                training.setModifiedBy(
                        rs.getString("ModifiedBy")
                );

                Timestamp modifiedAt =
                        rs.getTimestamp("ModifiedAt");

                if (modifiedAt != null) {

                    training.setModifiedAt(
                            modifiedAt.toLocalDateTime()
                    );
                }

                // Trainer Name

                training.setTrainerFirstName(
                        rs.getString("TrainerFirstName")
                );

                training.setTrainerLastName(
                        rs.getString("TrainerLastName")
                );

                // Training Type Name

                training.setTrainingTypeName(
                        rs.getString("TrainingTypeName")
                );

                // Employee Name

                training.setUserFirstName(
                        rs.getString("UserFirstName")
                );

                training.setUserLastName(
                        rs.getString("UserLastName")
                );

                trainings.add(training);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch trainings",
                    e
            );
        }

        return trainings;
    }


    // =========================================================
    // ADD TRAINING
    // =========================================================

    public void addTraining(Training training) {

        String sql =
                "INSERT INTO Training " +
                        "(TrainerId, TrainingTypeId, UserId, TrainingCost, " +
                        "Description, Status, StartDate, EndDate, " +
                        "CreatedAt, CreatedBy) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(
                    1,
                    training.getTrainerId()
            );

            statement.setInt(
                    2,
                    training.getTrainingTypeId()
            );

            statement.setInt(
                    3,
                    training.getUserId()
            );

            statement.setDouble(
                    4,
                    training.getTrainingCost()
            );

            statement.setString(
                    5,
                    training.getDescription()
            );

            statement.setString(
                    6,
                    training.getStatus()
            );

            statement.setTimestamp(
                    7,
                    Timestamp.valueOf(
                            training.getStartDate()
                    )
            );

            statement.setTimestamp(
                    8,
                    Timestamp.valueOf(
                            training.getEndDate()
                    )
            );

            statement.setString(
                    9,
                    training.getCreatedBy()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add training",
                    e
            );
        }
    }


    // =========================================================
    // GET TRAINING BY ID
    // =========================================================

    public Training getTrainingById(int id) {

        Training training = null;

        String sql =
                "SELECT t.TrainingId, " +
                        "t.TrainerId, " +
                        "t.TrainingTypeId, " +
                        "t.UserId, " +
                        "t.TrainingCost, " +
                        "t.Description, " +
                        "t.Status, " +
                        "t.StartDate, " +
                        "t.EndDate, " +
                        "t.CreatedAt, " +
                        "t.CreatedBy, " +
                        "t.ModifiedBy, " +
                        "t.ModifiedAt, " +

                        "tr.FirstName AS TrainerFirstName, " +
                        "tr.LastName AS TrainerLastName, " +

                        "tt.TrainingTypeName AS TrainingTypeName, " +

                        "u.FirstName AS UserFirstName, " +
                        "u.LastName AS UserLastName " +

                        "FROM Training t " +

                        "LEFT JOIN Trainer tr " +
                        "ON t.TrainerId = tr.TrainerId " +

                        "LEFT JOIN TrainingType tt " +
                        "ON t.TrainingTypeId = tt.TrainingTypeId " +

                        "LEFT JOIN `User` u " +
                        "ON t.UserId = u.UserId " +

                        "WHERE t.TrainingId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {

                if (rs.next()) {

                    training = new Training();

                    training.setTrainingId(
                            rs.getInt("TrainingId")
                    );

                    training.setTrainerId(
                            rs.getInt("TrainerId")
                    );

                    training.setTrainingTypeId(
                            rs.getInt("TrainingTypeId")
                    );

                    training.setUserId(
                            rs.getInt("UserId")
                    );

                    training.setTrainingCost(
                            rs.getDouble("TrainingCost")
                    );

                    training.setDescription(
                            rs.getString("Description")
                    );

                    training.setStatus(
                            rs.getString("Status")
                    );

                    Timestamp startDate =
                            rs.getTimestamp("StartDate");

                    if (startDate != null) {

                        training.setStartDate(
                                startDate.toLocalDateTime()
                        );
                    }

                    Timestamp endDate =
                            rs.getTimestamp("EndDate");

                    if (endDate != null) {

                        training.setEndDate(
                                endDate.toLocalDateTime()
                        );
                    }

                    Timestamp createdAt =
                            rs.getTimestamp("CreatedAt");

                    if (createdAt != null) {

                        training.setCreatedAt(
                                createdAt.toLocalDateTime()
                        );
                    }

                    training.setCreatedBy(
                            rs.getString("CreatedBy")
                    );

                    training.setModifiedBy(
                            rs.getString("ModifiedBy")
                    );

                    Timestamp modifiedAt =
                            rs.getTimestamp("ModifiedAt");

                    if (modifiedAt != null) {

                        training.setModifiedAt(
                                modifiedAt.toLocalDateTime()
                        );
                    }

                    // Trainer Name

                    training.setTrainerFirstName(
                            rs.getString("TrainerFirstName")
                    );

                    training.setTrainerLastName(
                            rs.getString("TrainerLastName")
                    );

                    // Training Type Name

                    training.setTrainingTypeName(
                            rs.getString("TrainingTypeName")
                    );

                    // Employee Name

                    training.setUserFirstName(
                            rs.getString("UserFirstName")
                    );

                    training.setUserLastName(
                            rs.getString("UserLastName")
                    );
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch training",
                    e
            );
        }

        return training;
    }


    // =========================================================
    // UPDATE TRAINING
    // =========================================================

    public void updateTraining(Training training) {

        String sql =
                "UPDATE Training SET " +
                        "TrainerId = ?, " +
                        "TrainingTypeId = ?, " +
                        "UserId = ?, " +
                        "TrainingCost = ?, " +
                        "Description = ?, " +
                        "Status = ?, " +
                        "StartDate = ?, " +
                        "EndDate = ?, " +
                        "ModifiedBy = ?, " +
                        "ModifiedAt = NOW() " +
                        "WHERE TrainingId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(
                    1,
                    training.getTrainerId()
            );

            statement.setInt(
                    2,
                    training.getTrainingTypeId()
            );

            statement.setInt(
                    3,
                    training.getUserId()
            );

            statement.setDouble(
                    4,
                    training.getTrainingCost()
            );

            statement.setString(
                    5,
                    training.getDescription()
            );

            statement.setString(
                    6,
                    training.getStatus()
            );

            statement.setTimestamp(
                    7,
                    Timestamp.valueOf(
                            training.getStartDate()
                    )
            );

            statement.setTimestamp(
                    8,
                    Timestamp.valueOf(
                            training.getEndDate()
                    )
            );

            statement.setString(
                    9,
                    training.getModifiedBy()
            );

            statement.setInt(
                    10,
                    training.getTrainingId()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to update training",
                    e
            );
        }
    }


    // =========================================================
    // DELETE TRAINING
    // =========================================================

    public void deleteTraining(int id) {

        String sql =
                "DELETE FROM Training WHERE TrainingId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to delete training",
                    e
            );
        }
    }


    // =========================================================
    // GET USERS FOR EMPLOYEE DROPDOWN
    // =========================================================

    public List<models.Employees.User> getAllUsers() {

        List<models.Employees.User> users = new ArrayList<>();

        String sql =
                "SELECT UserId, FirstName, LastName " +
                        "FROM `User` " +
                        "WHERE RoleId <> 3 " +
                        "AND (Status IS NULL OR Status = 'Active')";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {

                models.Employees.User user =
                        new models.Employees.User();

                user.setUserId(
                        rs.getInt("UserId")
                );

                user.setFirstName(
                        rs.getString("FirstName")
                );

                user.setLastName(
                        rs.getString("LastName")
                );

                users.add(user);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch users",
                    e
            );
        }

        return users;
    }
}