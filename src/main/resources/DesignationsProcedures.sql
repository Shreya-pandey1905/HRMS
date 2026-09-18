-- Designations Procedures

DELIMITER //

DROP PROCEDURE IF EXISTS GetAllDesignations //
CREATE PROCEDURE GetAllDesignations()
BEGIN
    SELECT
        DesignationId,
        DepartmentId,
        Name,
        NoOfEmployee,
        status,
        CreatedAt,
        CreatedBy,
        ModifiedBy,
        ModifiedAt
    FROM Designations
    ORDER BY DesignationId DESC;
END //


DROP PROCEDURE IF EXISTS GetDesignationById //
CREATE PROCEDURE GetDesignationById(
    IN p_DesignationId INT
)
BEGIN
    SELECT
        DesignationId,
        DepartmentId,
        Name,
        NoOfEmployee,
        status,
        CreatedAt,
        CreatedBy,
        ModifiedBy,
        ModifiedAt
    FROM Designations
    WHERE DesignationId = p_DesignationId;
END //


DROP PROCEDURE IF EXISTS AddDesignation //
CREATE PROCEDURE AddDesignation(
    IN p_DepartmentId INT,
    IN p_Name LONGTEXT,
    IN p_NoOfEmployee INT,
    IN p_Status LONGTEXT,
    IN p_CreatedBy VARCHAR(255)
)
BEGIN
    INSERT INTO Designations
    (
        DepartmentId,
        Name,
        NoOfEmployee,
        status,
        CreatedAt,
        CreatedBy
    )
    VALUES
    (
        p_DepartmentId,
        p_Name,
        p_NoOfEmployee,
        p_Status,
        NOW(),
        p_CreatedBy
    );
END //


DROP PROCEDURE IF EXISTS UpdateDesignation //
CREATE PROCEDURE UpdateDesignation(
    IN p_DesignationId INT,
    IN p_DepartmentId INT,
    IN p_Name LONGTEXT,
    IN p_NoOfEmployee INT,
    IN p_Status LONGTEXT,
    IN p_ModifiedBy VARCHAR(255)
)
BEGIN
    UPDATE Designations
    SET
        DepartmentId = p_DepartmentId,
        Name = p_Name,
        NoOfEmployee = p_NoOfEmployee,
        status = p_Status,
        ModifiedBy = p_ModifiedBy,
        ModifiedAt = NOW()
    WHERE DesignationId = p_DesignationId;
END //


DROP PROCEDURE IF EXISTS DeleteDesignation //
CREATE PROCEDURE DeleteDesignation(
    IN p_DesignationId INT
)
BEGIN
    DELETE FROM Designations
    WHERE DesignationId = p_DesignationId;
END //

DELIMITER ;
