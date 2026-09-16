-- =============================================================
-- HRMS Leave Feature - NEW objects only
-- This file intentionally does NOT modify any existing procedure.
-- Run this file once against Pulse360Db before using the admin leave UI.
-- =============================================================

DELIMITER //

CREATE TABLE IF NOT EXISTS LeaveSettings (
    LeaveSettingId INT NOT NULL AUTO_INCREMENT,
    LeaveTypeId INT NOT NULL,
    IsActive TINYINT(1) NOT NULL DEFAULT 1,
    DefaultLeaves INT NOT NULL DEFAULT 0,
    AllowCarryForward TINYINT(1) NOT NULL DEFAULT 0,
    MaxCarryForward INT NOT NULL DEFAULT 0,
    IsEarnedLeave TINYINT(1) NOT NULL DEFAULT 0,
    UpdatedBy VARCHAR(255) NULL,
    UpdatedAt DATETIME NULL,
    PRIMARY KEY (LeaveSettingId),
    UNIQUE KEY UK_LeaveSettings_LeaveType (LeaveTypeId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci//

INSERT INTO LeaveSettings
    (LeaveTypeId, IsActive, DefaultLeaves, AllowCarryForward, MaxCarryForward, IsEarnedLeave, UpdatedAt)
SELECT
    m.LeaveTypeId, 1, 0, 0, 0, 0, NOW()
FROM MasterLeaveTypes m
LEFT JOIN LeaveSettings s ON s.LeaveTypeId = m.LeaveTypeId
WHERE s.LeaveTypeId IS NULL//

DROP PROCEDURE IF EXISTS GetLeaveTypes//
CREATE PROCEDURE GetLeaveTypes()
BEGIN
    SELECT m.LeaveTypeId,
           m.LeaveType,
           COALESCE(s.IsActive, 1) AS IsActive
    FROM MasterLeaveTypes m
    LEFT JOIN LeaveSettings s ON s.LeaveTypeId = m.LeaveTypeId
    ORDER BY m.LeaveType ASC, m.LeaveTypeId ASC;
END //

DROP PROCEDURE IF EXISTS GetActiveLeaveTypes//
CREATE PROCEDURE GetActiveLeaveTypes()
BEGIN
    SELECT m.LeaveTypeId,
           m.LeaveType
    FROM MasterLeaveTypes m
    LEFT JOIN LeaveSettings s ON s.LeaveTypeId = m.LeaveTypeId
    WHERE COALESCE(s.IsActive, 1) = 1
    ORDER BY m.LeaveType ASC, m.LeaveTypeId ASC;
END //

DROP PROCEDURE IF EXISTS AddLeaveType//
CREATE PROCEDURE AddLeaveType(IN p_leaveType LONGTEXT)
BEGIN
    DECLARE v_leaveTypeId INT;

    IF p_leaveType IS NULL OR TRIM(p_leaveType) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type is required.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM MasterLeaveTypes
        WHERE LOWER(TRIM(LeaveType)) = LOWER(TRIM(p_leaveType))
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type already exists.';
    END IF;

    INSERT INTO MasterLeaveTypes (LeaveType)
    VALUES (TRIM(p_leaveType));

    SET v_leaveTypeId = LAST_INSERT_ID();

    INSERT INTO LeaveSettings
        (LeaveTypeId, IsActive, DefaultLeaves, AllowCarryForward, MaxCarryForward, IsEarnedLeave, UpdatedAt)
    VALUES
        (v_leaveTypeId, 1, 0, 0, 0, 0, NOW());
END //

DROP PROCEDURE IF EXISTS DeleteLeaveType//
CREATE PROCEDURE DeleteLeaveType(IN p_leaveTypeId INT)
BEGIN
    IF EXISTS (SELECT 1 FROM DepartmentLeaves WHERE LeaveTypeId = p_leaveTypeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type cannot be deleted because it is already allocated to a department.';
    END IF;

    IF EXISTS (SELECT 1 FROM LeaveRequests WHERE LeaveTypeId = p_leaveTypeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type cannot be deleted because leave requests already exist for it.';
    END IF;

    DELETE FROM LeaveSettings WHERE LeaveTypeId = p_leaveTypeId;
    DELETE FROM MasterLeaveTypes WHERE LeaveTypeId = p_leaveTypeId;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type not found.';
    END IF;
END //

DROP PROCEDURE IF EXISTS GetLeaveSettings//
CREATE PROCEDURE GetLeaveSettings()
BEGIN
    SELECT s.LeaveSettingId,
           m.LeaveTypeId,
           m.LeaveType,
           COALESCE(s.IsActive, 1) AS IsActive,
           COALESCE(s.DefaultLeaves, 0) AS DefaultLeaves,
           COALESCE(s.AllowCarryForward, 0) AS AllowCarryForward,
           COALESCE(s.MaxCarryForward, 0) AS MaxCarryForward,
           COALESCE(s.IsEarnedLeave, 0) AS IsEarnedLeave,
           s.UpdatedBy,
           s.UpdatedAt
    FROM MasterLeaveTypes m
    LEFT JOIN LeaveSettings s ON s.LeaveTypeId = m.LeaveTypeId
    ORDER BY m.LeaveType ASC, m.LeaveTypeId ASC;
END //

DROP PROCEDURE IF EXISTS UpdateLeaveSetting//
CREATE PROCEDURE UpdateLeaveSetting(
    IN p_leaveTypeId INT,
    IN p_isActive TINYINT,
    IN p_defaultLeaves INT,
    IN p_allowCarryForward TINYINT,
    IN p_maxCarryForward INT,
    IN p_isEarnedLeave TINYINT,
    IN p_updatedBy VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM MasterLeaveTypes WHERE LeaveTypeId = p_leaveTypeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type not found.';
    END IF;

    IF p_defaultLeaves < 0 OR p_maxCarryForward < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave days cannot be negative.';
    END IF;

    IF p_allowCarryForward = 0 AND p_maxCarryForward <> 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Maximum carry forward must be zero when carry forward is disabled.';
    END IF;

    INSERT INTO LeaveSettings
        (LeaveTypeId, IsActive, DefaultLeaves, AllowCarryForward, MaxCarryForward, IsEarnedLeave, UpdatedBy, UpdatedAt)
    VALUES
        (p_leaveTypeId, p_isActive, p_defaultLeaves, p_allowCarryForward, p_maxCarryForward, p_isEarnedLeave, p_updatedBy, NOW())
    ON DUPLICATE KEY UPDATE
        IsActive = VALUES(IsActive),
        DefaultLeaves = VALUES(DefaultLeaves),
        AllowCarryForward = VALUES(AllowCarryForward),
        MaxCarryForward = VALUES(MaxCarryForward),
        IsEarnedLeave = VALUES(IsEarnedLeave),
        UpdatedBy = VALUES(UpdatedBy),
        UpdatedAt = NOW();
END //

DROP PROCEDURE IF EXISTS UpdateLeaveStatus//
CREATE PROCEDURE UpdateLeaveStatus(
    IN p_leaveTypeId INT,
    IN p_isActive TINYINT,
    IN p_updatedBy VARCHAR(255)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM MasterLeaveTypes WHERE LeaveTypeId = p_leaveTypeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type not found.';
    END IF;

    INSERT INTO LeaveSettings (LeaveTypeId, IsActive, UpdatedBy, UpdatedAt)
    VALUES (p_leaveTypeId, p_isActive, p_updatedBy, NOW())
    ON DUPLICATE KEY UPDATE
        IsActive = VALUES(IsActive),
        UpdatedBy = VALUES(UpdatedBy),
        UpdatedAt = NOW();
END //

DROP PROCEDURE IF EXISTS GetDepartmentLeaveDetails//
CREATE PROCEDURE GetDepartmentLeaveDetails()
BEGIN
    SELECT dl.DepartmentLeavesId,
           dl.DepartmentId,
           d.Name AS DepartmentName,
           dl.LeaveTypeId,
           m.LeaveType,
           dl.LeavesCount,
            CASE WHEN COALESCE(s.IsActive, 1) = 1 THEN 'Active' ELSE 'Inactive' END AS Status
    FROM DepartmentLeaves dl
    INNER JOIN Departments d ON d.DepartmentId = dl.DepartmentId
    INNER JOIN MasterLeaveTypes m ON m.LeaveTypeId = dl.LeaveTypeId
        LEFT JOIN LeaveSettings s ON s.LeaveTypeId = dl.LeaveTypeId
    ORDER BY d.Name ASC, m.LeaveType ASC, dl.DepartmentLeavesId DESC;
END //

DROP PROCEDURE IF EXISTS AllocateDepartmentLeave//
CREATE PROCEDURE AllocateDepartmentLeave(
    IN p_departmentId INT,
    IN p_leaveTypeId INT,
    IN p_leavesCount INT
)
BEGIN
    DECLARE v_departmentLeavesId INT DEFAULT NULL;
    DECLARE v_usedLeaves INT DEFAULT 0;

    IF p_leavesCount IS NULL OR p_leavesCount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Number of leaves must be greater than zero.';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM Departments
        WHERE DepartmentId = p_departmentId AND LOWER(Status) = 'active'
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only an active department can receive a leave allocation.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM MasterLeaveTypes WHERE LeaveTypeId = p_leaveTypeId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave type not found.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM LeaveSettings
        WHERE LeaveTypeId = p_leaveTypeId AND IsActive = 0
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This leave type is inactive in Leave Settings.';
    END IF;

    SELECT DepartmentLeavesId
      INTO v_departmentLeavesId
      FROM DepartmentLeaves
     WHERE DepartmentId = p_departmentId
       AND LeaveTypeId = p_leaveTypeId
     LIMIT 1;

    IF v_departmentLeavesId IS NULL THEN
        INSERT INTO DepartmentLeaves
            (DepartmentId, LeaveTypeId, LeavesCount, Status)
        VALUES
            (p_departmentId, p_leaveTypeId, p_leavesCount, 'Active');

        SET v_departmentLeavesId = LAST_INSERT_ID();
    ELSE
        SELECT COALESCE(MAX(UsedLeaves), 0)
          INTO v_usedLeaves
          FROM LeaveBalances
         WHERE DepartmentLeavesId = v_departmentLeavesId;

        IF p_leavesCount < v_usedLeaves THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Allocated leaves cannot be lower than leaves already used by an employee.';
        END IF;

        UPDATE DepartmentLeaves
           SET LeavesCount = p_leavesCount,
               Status = 'Active'
         WHERE DepartmentLeavesId = v_departmentLeavesId;
    END IF;

    INSERT INTO LeaveBalances
        (UserId, DepartmentLeavesId, LeaveTypeId, TotalLeaves, UsedLeaves)
    SELECT u.UserId,
           v_departmentLeavesId,
           p_leaveTypeId,
           p_leavesCount,
           0
      FROM User u
     WHERE u.DepartmentId = p_departmentId
       AND (u.Status IS NULL OR LOWER(u.Status) = 'active')
       AND NOT EXISTS (
           SELECT 1
             FROM LeaveBalances b
            WHERE b.UserId = u.UserId
              AND b.DepartmentLeavesId = v_departmentLeavesId
              AND b.LeaveTypeId = p_leaveTypeId
       );

    UPDATE LeaveBalances
       SET TotalLeaves = p_leavesCount
     WHERE DepartmentLeavesId = v_departmentLeavesId
       AND LeaveTypeId = p_leaveTypeId;
END //

DROP PROCEDURE IF EXISTS DeleteDepartmentLeave//
CREATE PROCEDURE DeleteDepartmentLeave(IN p_departmentLeavesId INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM DepartmentLeaves WHERE DepartmentLeavesId = p_departmentLeavesId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave allocation not found.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM LeaveBalances
        WHERE DepartmentLeavesId = p_departmentLeavesId
          AND UsedLeaves > 0
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave allocation cannot be deleted because employees have already used leave from this allocation.';
    END IF;

    DELETE FROM LeaveBalances
    WHERE DepartmentLeavesId = p_departmentLeavesId;

    DELETE FROM DepartmentLeaves
    WHERE DepartmentLeavesId = p_departmentLeavesId;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAllDepartments()
BEGIN
    SELECT departmentid,
           name,
           noofemployee,
           status,
           createdat,
           createdby,
           modifiedby,
           modifiedat
    FROM departments
    ORDER BY departmentid DESC;
END //
DELIMITER ;


