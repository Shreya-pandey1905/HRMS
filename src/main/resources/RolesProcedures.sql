-- Roles Procedure

DELIMITER //
CREATE PROCEDURE GetAllRoles()
BEGIN
    SELECT
        RoleId,
        RoleName,
        Status,
        CreatedAt,
        CreatedBy,
        ModifiedBy,
        ModifiedAt
    FROM Role
    ORDER BY RoleId DESC;
END //
DELIMITER ;

delimiter //
create PROCEDURE GetRoleById(IN p_roleId INT)
begin
    SELECT RoleId, RoleName, Status
    FROM `Role`
    WHERE RoleId = p_roleId;
end //

delimiter ;

DELIMITER //
CREATE PROCEDURE AddRole(
    IN p_RoleName LONGTEXT,
    IN p_Status LONGTEXT,
    IN p_CreatedBy VARCHAR(255)
)
BEGIN
    INSERT INTO Role
    (
        RoleName,
        Status,
        CreatedAt,
        CreatedBy
    )
    VALUES
    (
        p_RoleName,
        p_Status,
        NOW(),
        p_CreatedBy
    );
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UpdateRole(
    IN p_RoleId INT,
    IN p_RoleName LONGTEXT,
    IN p_Status LONGTEXT,
    IN p_ModifiedBy VARCHAR(255)
)
BEGIN
    UPDATE Role
    SET
        RoleName = p_RoleName,
        Status = p_Status,
        ModifiedBy = p_ModifiedBy,
        ModifiedAt = NOW()
    WHERE RoleId = p_RoleId;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteRole;

DELIMITER //

CREATE PROCEDURE DeleteRole(
    IN p_RoleId INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM user
        WHERE RoleId = p_RoleId
           OR RoleId1 = p_RoleId
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Role is being used by employees and cannot be deleted';
    ELSE
        DELETE FROM role
        WHERE RoleId = p_RoleId;
    END IF;
END //

DELIMITER ;