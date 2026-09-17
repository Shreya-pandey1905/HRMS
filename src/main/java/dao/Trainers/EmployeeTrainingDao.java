package dao.Trainers;

import models.Trainers.Training;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeTrainingDao {

    public List<Training> getMyTrainings(int userId) {

        List<Training> trainings = new ArrayList<>();

        String sql =
                "SELECT t.TrainingId, " + "t.TrainerId, " + "t.TrainingTypeId, " + "t.UserId, " + "t.TrainingCost, " + "t.Description, " +
                        "t.Status, " + "t.StartDate, " + "t.EndDate, " + "tr.FirstName AS TrainerFirstName, " +
                        "tr.LastName AS TrainerLastName, " +
                        "tt.TrainingTypeName AS TrainingTypeName " +
                        "FROM Training t " +
                        "LEFT JOIN Trainer tr " +
                        "ON t.TrainerId = tr.TrainerId " +
                        "LEFT JOIN TrainingType tt " +
                        "ON t.TrainingTypeId = tt.TrainingTypeId " +
                        "WHERE t.UserId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, userId);

            try (ResultSet rs = statement.executeQuery()) {

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

                    training.setTrainerFirstName(
                            rs.getString("TrainerFirstName")
                    );

                    training.setTrainerLastName(
                            rs.getString("TrainerLastName")
                    );

                    training.setTrainingTypeName(
                            rs.getString("TrainingTypeName")
                    );

                    trainings.add(training);
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee trainings",
                    e
            );
        }

        return trainings;
    }
}