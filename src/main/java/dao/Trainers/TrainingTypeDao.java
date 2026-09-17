package dao.Trainers;

import models.Trainers.TrainingType;
import util.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class TrainingTypeDao {

    public List<TrainingType> getAllTrainingTypes() {

        List<TrainingType> trainingTypes = new ArrayList<>();

        String sql = "SELECT TrainingTypeId, TrainingTypeName, Description, Status " +
                "FROM TrainingType";


        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {

                TrainingType trainingType = new TrainingType();

                trainingType.setTrainingTypeId(
                        rs.getInt("TrainingTypeId"));

                trainingType.setTrainingTypeName(
                        rs.getString("TrainingTypeName"));

                trainingType.setDescription(
                        rs.getString("Description"));

                trainingType.setStatus(
                        rs.getString("Status"));

                trainingTypes.add(trainingType);
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to fetch training types", e);
        }

        return trainingTypes;
    }


    public void addTrainingType(TrainingType trainingType) {

        String sql = "INSERT INTO TrainingType " +
                "(TrainingTypeName, Description, Status) " +
                "VALUES (?, ?, ?)";


        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, trainingType.getTrainingTypeName());
            statement.setString(2, trainingType.getDescription());
            statement.setString(3, trainingType.getStatus());

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to add training type", e);
        }
    }


    public TrainingType getTrainingTypeById(int id) {

        TrainingType trainingType = null;

        String sql = "SELECT TrainingTypeId, TrainingTypeName, " +
                     "Description, Status " +
                     "FROM TrainingType WHERE TrainingTypeId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {

                if (rs.next()) {

                    trainingType = new TrainingType();

                    trainingType.setTrainingTypeId(
                            rs.getInt("TrainingTypeId"));

                    trainingType.setTrainingTypeName(
                            rs.getString("TrainingTypeName"));

                    trainingType.setDescription(
                            rs.getString("Description"));

                    trainingType.setStatus(
                            rs.getString("Status"));
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to fetch training type", e);
        }

        return trainingType;
    }


    public void updateTrainingType(TrainingType trainingType) {

        String sql = "UPDATE TrainingType SET " +
                "TrainingTypeName = ?, " +
                "Description = ?, " +
                "Status = ? " +
                "WHERE TrainingTypeId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, trainingType.getTrainingTypeName());
            statement.setString(2, trainingType.getDescription());
            statement.setString(3, trainingType.getStatus());
            statement.setInt(4, trainingType.getTrainingTypeId());

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to update training type", e);
        }
    }


    public void deleteTrainingType(int id) {

        String sql =
                "DELETE FROM TrainingType WHERE TrainingTypeId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to delete training type", e);
        }
    }
}