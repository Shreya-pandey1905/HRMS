-- Roles Procedures

DELIMITER //

DROP PROCEDURE IF EXISTS GetAllRoles //
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
    FROM `Role`
    ORDER BY RoleId DESC;
END //


DROP PROCEDURE IF EXISTS GetRoleById //
CREATE PROCEDURE GetRoleById(
    IN p_roleId INT
)
BEGIN
    SELECT
        RoleId,
        RoleName,
        Status
    FROM `Role`
    WHERE RoleId = p_roleId;
END //


DROP PROCEDURE IF EXISTS AddRole //
CREATE PROCEDURE AddRole(
    IN p_RoleName LONGTEXT,
    IN p_Status LONGTEXT,
    IN p_CreatedBy VARCHAR(255)
)
BEGIN
    INSERT INTO `Role`
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


DROP PROCEDURE IF EXISTS UpdateRole //
CREATE PROCEDURE UpdateRole(
    IN p_RoleId INT,
    IN p_RoleName LONGTEXT,
    IN p_Status LONGTEXT,
    IN p_ModifiedBy VARCHAR(255)
)
BEGIN
    UPDATE `Role`
    SET
        RoleName = p_RoleName,
        Status = p_Status,
        ModifiedBy = p_ModifiedBy,
        ModifiedAt = NOW()
    WHERE RoleId = p_RoleId;
END //


DROP PROCEDURE IF EXISTS DeleteRole //
CREATE PROCEDURE DeleteRole(
    IN p_RoleId INT
)
BEGIN
    DELETE FROM `Role`
    WHERE RoleId = p_RoleId;
END //

DELIMITER ;
