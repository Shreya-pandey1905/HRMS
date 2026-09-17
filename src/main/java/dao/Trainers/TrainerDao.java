package dao.Trainers;

import models.Trainers.Trainer;
import util.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TrainerDao {

    public List<Trainer> getAllTrainers() {

        List<Trainer> trainers = new ArrayList<>();

        String sql = "SELECT TrainerId, FirstName, LastName, Role, Email, " +
                     "Description, Status, Phone, ProfilePicture " +
                     "FROM Trainer";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {

                Trainer trainer = new Trainer();

                trainer.setTrainerId(rs.getInt("TrainerId"));
                trainer.setFirstName(rs.getString("FirstName"));
                trainer.setLastName(rs.getString("LastName"));
                trainer.setRole(rs.getString("Role"));
                trainer.setEmail(rs.getString("Email"));
                trainer.setDescription(rs.getString("Description"));
                trainer.setStatus(rs.getString("Status"));
                trainer.setPhone(rs.getLong("Phone"));
                trainer.setProfilePicture(rs.getString("ProfilePicture"));

                trainers.add(trainer);
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch trainers", e);
        }

        return trainers;
    }

    public void addTrainer(Trainer trainer) {

        String sql = "INSERT INTO Trainer " +
                     "(FirstName, LastName, Role, Email, Description, Status, Phone, ProfilePicture) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, trainer.getFirstName());
            statement.setString(2, trainer.getLastName());
            statement.setString(3, trainer.getRole());
            statement.setString(4, trainer.getEmail());
            statement.setString(5, trainer.getDescription());
            statement.setString(6, trainer.getStatus());
            statement.setLong(7, trainer.getPhone());
            statement.setString(8, trainer.getProfilePicture());

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Unable to add trainer", e);
        }
    }

    public Trainer getTrainerById(int id) {

        Trainer trainer = null;

        String sql = "SELECT TrainerId, FirstName, LastName, Role, Email, " +
                     "Description, Status, Phone, ProfilePicture " +
                     "FROM Trainer WHERE TrainerId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {

                if (rs.next()) {

                    trainer = new Trainer();

                    trainer.setTrainerId(rs.getInt("TrainerId"));
                    trainer.setFirstName(rs.getString("FirstName"));
                    trainer.setLastName(rs.getString("LastName"));
                    trainer.setRole(rs.getString("Role"));
                    trainer.setEmail(rs.getString("Email"));
                    trainer.setDescription(rs.getString("Description"));
                    trainer.setStatus(rs.getString("Status"));
                    trainer.setPhone(rs.getLong("Phone"));
                    trainer.setProfilePicture(rs.getString("ProfilePicture"));
                }
            }

        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch trainer", e);
        }

        return trainer;
    }

    public void updateTrainer(Trainer trainer) {

        String sql = "UPDATE Trainer SET " +
                     "FirstName = ?, " +
                     "LastName = ?, " +
                     "Role = ?, " +
                     "Email = ?, " +
                     "Description = ?, " +
                     "Status = ?, " +
                     "Phone = ?, " +
                     "ProfilePicture = ? " +
                     "WHERE TrainerId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, trainer.getFirstName());
            statement.setString(2, trainer.getLastName());
            statement.setString(3, trainer.getRole());
            statement.setString(4, trainer.getEmail());
            statement.setString(5, trainer.getDescription());
            statement.setString(6, trainer.getStatus());
            statement.setLong(7, trainer.getPhone());
            statement.setString(8, trainer.getProfilePicture());
            statement.setInt(9, trainer.getTrainerId());

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Unable to update trainer", e);
        }
    }

    public void deleteTrainer(int id) {

        String sql = "DELETE FROM Trainer WHERE TrainerId = ?";

        try (Connection connection = DBConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException("Unable to delete trainer", e);
        }
    }
}