package dao.Promotions;

import models.Promotions.Promotion;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PromotionDao {

    // ADD PROMOTION
    public void addPromotion(Promotion promotion) {

        String sql = "{CALL AddPromotion(?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, promotion.getUserId());

            statement.setString(
                    2,
                    promotion.getDesignationFrom()
            );

            statement.setString(
                    3,
                    promotion.getDesignationTo()
            );

            statement.setTimestamp(
                    4,
                    Timestamp.valueOf(promotion.getDate())
            );

            statement.execute();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to add promotion",
                    e
            );
        }
    }


    // GET ALL PROMOTIONS
    public List<Promotion> getAllPromotions() {

        List<Promotion> promotions = new ArrayList<>();

        String sql = "{CALL GetAllPromotions()}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql);
                ResultSet resultSet =
                        statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Promotion promotion = new Promotion();


                // Promotion ID
                promotion.setPromotionId(
                        resultSet.getInt("PromotionId")
                );


                // User ID
                promotion.setUserId(
                        resultSet.getInt("UserID")
                );


                // Employee name
                promotion.setFirstName(
                        resultSet.getString("FirstName")
                );

                promotion.setLastName(
                        resultSet.getString("LastName")
                );


                // Department
                promotion.setDepartment(
                        resultSet.getString("Department")
                );


                // Designation
                promotion.setDesignationFrom(
                        resultSet.getString("DesignationFrom")
                );

                promotion.setDesignationTo(
                        resultSet.getString("DesignationTo")
                );


                // Promotion date
                promotion.setDate(
                        resultSet
                                .getTimestamp("PromotionDate")
                                .toLocalDateTime()
                );


                promotions.add(promotion);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to get promotions",
                    e
            );
        }

        return promotions;
    }

    public Promotion getPromotionById(int promotionId) {

        String sql = "{CALL GetPromotionById(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(1, promotionId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Promotion promotion = new Promotion();

                    promotion.setPromotionId(
                            resultSet.getInt("PromotionId")
                    );

                    promotion.setUserId(
                            resultSet.getInt("UserID")
                    );

                    promotion.setDesignationFrom(
                            resultSet.getString("DesignationFrom")
                    );

                    promotion.setDesignationTo(
                            resultSet.getString("DesignationTo")
                    );

                    promotion.setDate(
                            resultSet.getTimestamp("Date")
                                    .toLocalDateTime()
                    );

                    return promotion;
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to get promotion",
                    e
            );
        }

        return null;
    }

    public void updatePromotion(Promotion promotion) {

        String sql = "{CALL UpdatePromotion(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement statement = connection.prepareCall(sql)
        ) {

            statement.setInt(
                    1,
                    promotion.getPromotionId()
            );

            statement.setInt(
                    2,
                    promotion.getUserId()
            );

            statement.setString(
                    3,
                    promotion.getDesignationFrom()
            );

            statement.setString(
                    4,
                    promotion.getDesignationTo()
            );

            statement.setTimestamp(
                    5,
                    Timestamp.valueOf(promotion.getDate())
            );

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to update promotion",
                    e
            );
        }
    }

    public void deletePromotion(int promotionId) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement =
                     connection.prepareCall("{CALL DeletePromotion(?)}")) {

            statement.setInt(1, promotionId);

            statement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to delete promotion",
                    e
            );
        }
    }
}