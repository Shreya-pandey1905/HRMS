DELIMITER //

CREATE PROCEDURE GetAllUsers()
BEGIN
SELECT
    UserId,
    FirstName,
    LastName
FROM user
ORDER BY FirstName, LastName;
END //

DELIMITER ;