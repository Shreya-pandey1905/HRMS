-- Employee Details

DELIMITER $$

DROP PROCEDURE IF EXISTS GetEmployeeCompleteDetails $$
CREATE PROCEDURE GetEmployeeCompleteDetails(
    IN p_UserId INT
)
BEGIN

    -- Result Set 1: User details
    SELECT
        UserId,
        FirstName,
        LastName,
        Email,
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
        ModifiedBy,
        ModifiedAt,
        Status
    FROM `User`
    WHERE UserId = p_UserId;

    -- Result Set 2: Bank details
    SELECT
        BankDetailId,
        BankName,
        AccountNumber,
        IFSCCode,
        BranchName,
        UserId
    FROM EmployeeBankDetails
    WHERE UserId = p_UserId;

    -- Result Set 3: Family details
    SELECT
        FamilyDetailId,
        Name,
        Relation,
        DateOfBirth,
        phone,
        UserId
    FROM EmployeeFamilyDetails
    WHERE UserId = p_UserId;

    -- Result Set 4: Education details
    SELECT
        EducationDetailsId,
        EducationType,
        UniversityName,
        UserId,
        startdate,
        enddate
    FROM EducationDetails
    WHERE UserId = p_UserId;

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS AddEducationDetails $$
CREATE PROCEDURE AddEducationDetails(
    IN p_EducationType LONGTEXT,
    IN p_UniversityName LONGTEXT,
    IN p_UserId INT,
    IN p_StartDate DATETIME,
    IN p_EndDate DATETIME
)
BEGIN
    INSERT INTO EducationDetails
    (
        EducationType,
        UniversityName,
        UserId,
        startdate,
        enddate
    )
    VALUES
    (
        p_EducationType,
        p_UniversityName,
        p_UserId,
        p_StartDate,
        p_EndDate
    );
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS AddEmployeeBankDetails $$
CREATE PROCEDURE AddEmployeeBankDetails(
    IN p_BankName LONGTEXT,
    IN p_AccountNumber LONGTEXT,
    IN p_IFSCCode LONGTEXT,
    IN p_BranchName LONGTEXT,
    IN p_UserId INT
)
BEGIN
    INSERT INTO EmployeeBankDetails
    (
        BankName,
        AccountNumber,
        IFSCCode,
        BranchName,
        UserId
    )
    VALUES
    (
        p_BankName,
        p_AccountNumber,
        p_IFSCCode,
        p_BranchName,
        p_UserId
    );
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS AddEmployeeFamilyDetails $$
CREATE PROCEDURE AddEmployeeFamilyDetails(
    IN p_Name LONGTEXT,
    IN p_Relation LONGTEXT,
    IN p_DateOfBirth DATETIME,
    IN p_Phone LONGTEXT,
    IN p_UserId INT
)
BEGIN
    INSERT INTO EmployeeFamilyDetails
    (
        Name,
        Relation,
        DateOfBirth,
        phone,
        UserId
    )
    VALUES
    (
        p_Name,
        p_Relation,
        p_DateOfBirth,
        p_Phone,
        p_UserId
    );
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetBankDetailsByUserId $$
CREATE PROCEDURE GetBankDetailsByUserId(
    IN p_UserId INT
)
BEGIN
    SELECT
        BankDetailId,
        BankName,
        AccountNumber,
        IFSCCode,
        BranchName,
        UserId
    FROM EmployeeBankDetails
    WHERE UserId = p_UserId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetBankDetailsById $$
CREATE PROCEDURE GetBankDetailsById(
    IN p_BankDetailId INT
)
BEGIN
    SELECT
        BankDetailId,
        BankName,
        AccountNumber,
        IFSCCode,
        BranchName,
        UserId
    FROM EmployeeBankDetails
    WHERE BankDetailId = p_BankDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetFamilyDetailsById $$
CREATE PROCEDURE GetFamilyDetailsById(
    IN p_FamilyDetailId INT
)
BEGIN
    SELECT
        FamilyDetailId,
        Name,
        Relation,
        DateOfBirth,
        phone,
        UserId
    FROM EmployeeFamilyDetails
    WHERE FamilyDetailId = p_FamilyDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetEducationDetailsById $$
CREATE PROCEDURE GetEducationDetailsById(
    IN p_EducationDetailsId INT
)
BEGIN
    SELECT
        EducationDetailsId,
        EducationType,
        UniversityName,
        UserId,
        startdate,
        enddate
    FROM EducationDetails
    WHERE EducationDetailsId = p_EducationDetailsId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateEmployeeBankDetails $$
CREATE PROCEDURE UpdateEmployeeBankDetails(
    IN p_BankDetailId INT,
    IN p_BankName LONGTEXT,
    IN p_AccountNumber LONGTEXT,
    IN p_IFSCCode LONGTEXT,
    IN p_BranchName LONGTEXT
)
BEGIN
    UPDATE EmployeeBankDetails
    SET
        BankName = p_BankName,
        AccountNumber = p_AccountNumber,
        IFSCCode = p_IFSCCode,
        BranchName = p_BranchName
    WHERE BankDetailId = p_BankDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateEmployeeFamilyDetails $$
CREATE PROCEDURE UpdateEmployeeFamilyDetails(
    IN p_FamilyDetailId INT,
    IN p_Name LONGTEXT,
    IN p_Relation LONGTEXT,
    IN p_DateOfBirth DATETIME,
    IN p_Phone LONGTEXT
)
BEGIN
    UPDATE EmployeeFamilyDetails
    SET
        Name = p_Name,
        Relation = p_Relation,
        DateOfBirth = p_DateOfBirth,
        phone = p_Phone
    WHERE FamilyDetailId = p_FamilyDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateEducationDetails $$
CREATE PROCEDURE UpdateEducationDetails(
    IN p_EducationDetailsId INT,
    IN p_EducationType LONGTEXT,
    IN p_UniversityName LONGTEXT,
    IN p_StartDate DATETIME,
    IN p_EndDate DATETIME
)
BEGIN
    UPDATE EducationDetails
    SET
        EducationType = p_EducationType,
        UniversityName = p_UniversityName,
        startdate = p_StartDate,
        enddate = p_EndDate
    WHERE EducationDetailsId = p_EducationDetailsId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteEmployeeBankDetails $$
CREATE PROCEDURE DeleteEmployeeBankDetails(
    IN p_BankDetailId INT
)
BEGIN
    DELETE FROM EmployeeBankDetails
    WHERE BankDetailId = p_BankDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteEmployeeFamilyDetails $$
CREATE PROCEDURE DeleteEmployeeFamilyDetails(
    IN p_FamilyDetailId INT
)
BEGIN
    DELETE FROM EmployeeFamilyDetails
    WHERE FamilyDetailId = p_FamilyDetailId;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteEducationDetails $$
CREATE PROCEDURE DeleteEducationDetails(
    IN p_EducationDetailsId INT
)
BEGIN
    DELETE FROM EducationDetails
    WHERE EducationDetailsId = p_EducationDetailsId;
END $$

DELIMITER ;

-- Employee Details

DELIMITER $$

CREATE PROCEDURE CheckEmployeeEmail(
    IN p_Email LONGTEXT
)
BEGIN
    SELECT UserId
    FROM `User`
    WHERE Email = p_Email
    LIMIT 1;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetAllEmployeeDetails()
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

DELIMITER ;