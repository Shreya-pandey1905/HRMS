CREATE PROCEDURE GetAllEmployees()
BEGIN

SELECT
    UserId,
    FirstName,
    LastName
FROM user
WHERE RoleId = 10;

END //

DELIMITER ;