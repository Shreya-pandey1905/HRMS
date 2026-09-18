DELIMITER //

CREATE PROCEDURE AddPromotion(
    IN p_userId INT,
    IN p_designationFrom VARCHAR(100),
    IN p_designationTo VARCHAR(100),
    IN p_date DATETIME
)
BEGIN

INSERT INTO Promotion
(
    UserID,
    DesignationFrom,
    DesignationTo,
    Date
)
VALUES
    (
        p_userId,
        p_designationFrom,
        p_designationTo,
        p_date
    );

END //

DELIMITER ;


USE pulse360db;

DELIMITER //

CREATE PROCEDURE GetAllPromotions()
BEGIN

SELECT
    p.PromotionId,
    p.UserID,

    u.FirstName,
    u.LastName,

    d.Name AS Department,

    p.DesignationFrom,
    p.DesignationTo,

    p.Date AS PromotionDate

FROM Promotion p

         INNER JOIN User u
                    ON p.UserID = u.UserId

         INNER JOIN Departments d
                    ON u.DepartmentId = d.DepartmentId

ORDER BY p.Date DESC;

END //

DELIMITER ;

USE pulse360db;

DROP PROCEDURE IF EXISTS GetPromotionById;

DELIMITER //

CREATE PROCEDURE GetPromotionById(
    IN p_promotionId INT
)
BEGIN
SELECT
    PromotionId,
    UserID,
    DesignationFrom,
    DesignationTo,
    Date
FROM Promotion
WHERE PromotionId = p_promotionId;
END //

DELIMITER ;


USE pulse360db;

DROP PROCEDURE IF EXISTS UpdatePromotion;

DELIMITER //

CREATE PROCEDURE UpdatePromotion(
    IN p_promotionId INT,
    IN p_userId INT,
    IN p_designationFrom VARCHAR(100),
    IN p_designationTo VARCHAR(100),
    IN p_date DATETIME
)
BEGIN
UPDATE Promotion
SET
    UserID = p_userId,
    DesignationFrom = p_designationFrom,
    DesignationTo = p_designationTo,
    Date = p_date
WHERE PromotionId = p_promotionId;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DeletePromotion;

DELIMITER //

CREATE PROCEDURE DeletePromotion(
    IN p_promotionId INT
)
BEGIN
DELETE FROM Promotion
WHERE PromotionId = p_promotionId;
END //

DELIMITER ;