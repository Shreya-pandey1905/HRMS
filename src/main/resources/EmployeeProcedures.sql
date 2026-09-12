DELIMITER $$

CREATE PROCEDURE AddEmployee(
    IN p_FirstName LONGTEXT,
    IN p_LastName LONGTEXT,
    IN p_Email LONGTEXT,
    IN p_PasswordHash LONGTEXT,
    IN p_PhoneNumber LONGTEXT,
    IN p_RoleId INT,
    IN p_DepartmentId INT,
    IN p_DesignationId INT,
    IN p_DateOfJoining DATETIME,
    IN p_DateOfBirth DATETIME,
    IN p_Gender LONGTEXT,
    IN p_Address LONGTEXT,
    IN p_AboutEmployee LONGTEXT,
    IN p_ProfilePicture LONGTEXT,
    IN p_ReportingManager LONGTEXT,
    IN p_CreatedBy VARCHAR(255),
    IN p_Status VARCHAR(100)
)
BEGIN
    INSERT INTO `User` (
        FirstName,
        LastName,
        Email,
        PasswordHash,
        PhoneNumber,
        RoleId,
        DepartmentId,
        DesignationId,
        DateOfJoining,
        DateOfBirth,
        Gender,
        Address,
        AboutEmployee,
        ProfilePicture,
        ReportingManager,
        CreatedAt,
        CreatedBy,
        Status
    )
    VALUES (
        p_FirstName,
        p_LastName,
        p_Email,
        p_PasswordHash,
        p_PhoneNumber,
        p_RoleId,
        p_DepartmentId,
        p_DesignationId,
        p_DateOfJoining,
        p_DateOfBirth,
        p_Gender,
        p_Address,
        p_AboutEmployee,
        p_ProfilePicture,
        p_ReportingManager,
        NOW(),
        p_CreatedBy,
        p_Status
    );
END$$


CREATE PROCEDURE GetEmployeeById(
    IN p_UserId INT
)
BEGIN
    SELECT *
    FROM `User`
    WHERE UserId = p_UserId;
END$$


CREATE PROCEDURE UpdateEmployee(
    IN p_UserId INT,
    IN p_FirstName LONGTEXT,
    IN p_LastName LONGTEXT,
    IN p_Email LONGTEXT,
    IN p_PhoneNumber LONGTEXT,
    IN p_RoleId INT,
    IN p_DepartmentId INT,
    IN p_DesignationId INT,
    IN p_DateOfJoining DATETIME,
    IN p_DateOfBirth DATETIME,
    IN p_Gender LONGTEXT,
    IN p_Address LONGTEXT,
    IN p_AboutEmployee LONGTEXT,
    IN p_ProfilePicture LONGTEXT,
    IN p_ReportingManager LONGTEXT,
    IN p_ModifiedBy VARCHAR(255),
    IN p_Status VARCHAR(100)
)
BEGIN
    UPDATE `User`
    SET
        FirstName = p_FirstName,
        LastName = p_LastName,
        Email = p_Email,
        PhoneNumber = p_PhoneNumber,
        RoleId = p_RoleId,
        DepartmentId = p_DepartmentId,
        DesignationId = p_DesignationId,
        DateOfJoining = p_DateOfJoining,
        DateOfBirth = p_DateOfBirth,
        Gender = p_Gender,
        Address = p_Address,
        AboutEmployee = p_AboutEmployee,
        ProfilePicture = p_ProfilePicture,
        ReportingManager = p_ReportingManager,
        ModifiedBy = p_ModifiedBy,
        ModifiedAt = NOW(),
        Status = p_Status
    WHERE UserId = p_UserId;
END$$


CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT
        u.UserId,
        u.FirstName,
        u.LastName,
        u.Email,
        u.PasswordHash,
        u.PhoneNumber,
        u.RoleId,
        u.DepartmentId,
        u.DesignationId,
        u.DateOfJoining,
        u.DateOfBirth,
        u.Gender,
        u.Address,
        u.AboutEmployee,
        u.ProfilePicture,
        u.ReportingManager,
        u.CreatedAt,
        u.CreatedBy,
        u.ModifiedBy,
        u.ModifiedAt,
        u.Status,
        r.RoleName,
        d.Name AS DepartmentName,
        des.Name AS DesignationName
    FROM `User` u
    LEFT JOIN `Role` r
        ON u.RoleId = r.RoleId
    LEFT JOIN Departments d
        ON u.DepartmentId = d.DepartmentId
    LEFT JOIN Designations des
        ON u.DesignationId = des.DesignationId
    ORDER BY u.UserId DESC;
END$$


CREATE  PROCEDURE DeleteEmployee(
    IN p_UserId INT
)
BEGIN
    DELETE FROM `User`
    WHERE UserId = p_UserId;
END$$


CREATE  PROCEDURE GetEmployeeManagers()
BEGIN
    SELECT
        UserId,
        FirstName,
        LastName
    FROM `User`
    WHERE Status = 'Active'
    ORDER BY FirstName;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS GetAllRoles;

DELIMITER $$

CREATE PROCEDURE GetAllActiveRoles()
BEGIN
    SELECT
        RoleId,
        RoleName
    FROM `Role`
    WHERE Status = 'Active'
    ORDER BY RoleName;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetAllActiveDepartments()
BEGIN
    SELECT
        DepartmentId,
        Name AS DepartmentName
    FROM Departments
    WHERE Status = 'Active'
    ORDER BY Name;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetAllActiveDesignations()
BEGIN
    SELECT
        DesignationId,
        Name AS DesignationName,
        DepartmentId
    FROM Designations
    WHERE Status = 'Active'
    ORDER BY Name;
END$$

DELIMITER ;

SELECT DepartmentId, Name, Status
FROM Departments;
