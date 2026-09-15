package dao.Documents;

import models.Documents.GeneratedLetter;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GeneratedLetterDao {

    // =========================
    // ADMIN - GET ALL LETTERS
    // =========================

    public List<GeneratedLetter> getAll() {

        List<GeneratedLetter> letters = new ArrayList<>();

        String sql = "{CALL GetAllGeneratedLetters()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                GeneratedLetter letter =
                        new GeneratedLetter();

                letter.setGeneratedLetterId(
                        resultSet.getInt("GeneratedLetterId")
                );

                letter.setUserId(
                        resultSet.getInt("UserId")
                );

                letter.setEmployeeName(
                        resultSet.getString("EmployeeName")
                );

                letter.setEmployeeEmail(
                        resultSet.getString("Email")
                );

                letter.setLetterName(
                        resultSet.getString("LetterName")
                );

                letter.setLetterFile(
                        resultSet.getString("LetterFile")
                );

                if (resultSet.getTimestamp("GeneratedDate") != null) {

                    letter.setGeneratedDate(
                            resultSet.getTimestamp("GeneratedDate")
                                    .toString()
                    );
                }

                letters.add(letter);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch generated letters",
                    e
            );
        }

        return letters;
    }


    // =========================
    // EMPLOYEE - GET OWN LETTERS
    // =========================

    public List<GeneratedLetter> getEmployeeLetters(int userId) {

        List<GeneratedLetter> letters =
                new ArrayList<>();

        String sql =
                "{CALL GetEmployeeCompanyLetters(?)}";

        try (Connection connection =
                     DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                while (resultSet.next()) {

                    GeneratedLetter letter =
                            new GeneratedLetter();

                    letter.setGeneratedLetterId(
                            resultSet.getInt(
                                    "GeneratedLetterId"
                            )
                    );

                    letter.setUserId(
                            resultSet.getInt("UserId")
                    );

                    letter.setLetterName(
                            resultSet.getString(
                                    "LetterName"
                            )
                    );

                    letter.setLetterFile(
                            resultSet.getString(
                                    "LetterFile"
                            )
                    );

                    if (resultSet.getTimestamp(
                            "GeneratedDate"
                    ) != null) {

                        letter.setGeneratedDate(
                                resultSet.getTimestamp(
                                        "GeneratedDate"
                                ).toString()
                        );
                    }

                    letters.add(letter);
                }
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee company letters",
                    e
            );
        }

        return letters;
    }


    // =========================
    // ADD GENERATED LETTER
    // =========================

    public void add(GeneratedLetter letter) {

        String sql =
                "{CALL AddGeneratedLetter(?, ?, ?)}";

        try (Connection connection =
                     DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    letter.getUserId()
            );

            statement.setString(
                    2,
                    letter.getLetterName()
            );

            statement.setString(
                    3,
                    letter.getLetterFile()
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add generated letter",
                    e
            );
        }
    }


    // =========================
    // DELETE GENERATED LETTER
    // =========================

    public void delete(int generatedLetterId) {

        String sql =
                "{CALL DeleteGeneratedLetter(?)}";

        try (Connection connection =
                     DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    generatedLetterId
            );

            statement.executeUpdate();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to delete generated letter",
                    e
            );
        }
    }
}