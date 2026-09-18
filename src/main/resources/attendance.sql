-- ============================================================
-- Pulse360 HRMS - Employee Attendance Module
-- All attendance stored procedures live in this file.
-- Run this file after sqlFile.sql has created the Attendance table.
-- ============================================================

USE `Pulse360Db`;

DELIMITER $$

DROP PROCEDURE IF EXISTS AttendanceCheckIn$$
CREATE PROCEDURE AttendanceCheckIn(
    IN p_UserId INT,
    IN p_Date DATE,
    IN p_Now DATETIME
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM Attendance
        WHERE UserId = p_UserId AND DATE(Date) = p_Date
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Attendance is already checked in for today.';
    END IF;

    INSERT INTO Attendance
        (UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
         WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status)
    VALUES
        (p_UserId, p_Date, p_Now, NULL, NULL, NULL,
         0.00, 0.00, 0.00, 0.00, 0, 'Present');
END$$

DROP PROCEDURE IF EXISTS AttendanceLunchIn$$
CREATE PROCEDURE AttendanceLunchIn(
    IN p_UserId INT,
    IN p_Date DATE,
    IN p_Now DATETIME
)
BEGIN
    UPDATE Attendance
    SET LunchIn = p_Now
    WHERE UserId = p_UserId
      AND DATE(Date) = p_Date
      AND CheckIn IS NOT NULL
      AND LunchIn IS NULL
      AND LunchOut IS NULL
      AND CheckOut IS NULL;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance state. Lunch In is not available.';
    END IF;
END$$

DROP PROCEDURE IF EXISTS AttendanceLunchOut$$
CREATE PROCEDURE AttendanceLunchOut(
    IN p_UserId INT,
    IN p_Date DATE,
    IN p_Now DATETIME
)
BEGIN
    UPDATE Attendance
    SET LunchOut = p_Now
    WHERE UserId = p_UserId
      AND DATE(Date) = p_Date
      AND CheckIn IS NOT NULL
      AND LunchIn IS NOT NULL
      AND LunchOut IS NULL
      AND CheckOut IS NULL;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance state. Lunch Out is not available.';
    END IF;
END$$

DROP PROCEDURE IF EXISTS AttendanceCheckOut$$
CREATE PROCEDURE AttendanceCheckOut(
    IN p_UserId INT,
    IN p_Date DATE,
    IN p_Now DATETIME
)
BEGIN
    DECLARE v_WorkingHours DECIMAL(18,2) DEFAULT 0.00;
    DECLARE v_BreakHours DECIMAL(18,2) DEFAULT 0.00;
    DECLARE v_ProductionHours DECIMAL(18,2) DEFAULT 0.00;
    DECLARE v_OvertimeHours DECIMAL(18,2) DEFAULT 0.00;

    IF NOT EXISTS (
        SELECT 1 FROM Attendance
        WHERE UserId = p_UserId
          AND DATE(Date) = p_Date
          AND CheckIn IS NOT NULL
          AND LunchIn IS NOT NULL
          AND LunchOut IS NOT NULL
          AND CheckOut IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance state. Check Out is not available.';
    END IF;

    SELECT
        ROUND(TIMESTAMPDIFF(SECOND, CheckIn, p_Now) / 3600, 2),
        ROUND(TIMESTAMPDIFF(SECOND, LunchIn, LunchOut) / 3600, 2)
    INTO v_WorkingHours, v_BreakHours
    FROM Attendance
    WHERE UserId = p_UserId
      AND DATE(Date) = p_Date
      AND CheckIn IS NOT NULL
      AND LunchIn IS NOT NULL
      AND LunchOut IS NOT NULL
      AND CheckOut IS NULL
    LIMIT 1;

    SET v_ProductionHours = GREATEST(v_WorkingHours - v_BreakHours, 0.00);
    -- The existing attendance screen uses 9 hours as the daily target.
    SET v_OvertimeHours = GREATEST(v_ProductionHours - 9.00, 0.00);

    UPDATE Attendance
    SET CheckOut = p_Now,
        WorkingHours = v_WorkingHours,
        BreakHours = v_BreakHours,
        ProductionHours = v_ProductionHours,
        OvertimeHours = v_OvertimeHours,
        Status = 'Present'
    WHERE UserId = p_UserId
      AND DATE(Date) = p_Date
      AND CheckIn IS NOT NULL
      AND LunchIn IS NOT NULL
      AND LunchOut IS NOT NULL
      AND CheckOut IS NULL;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid attendance state. Check Out is not available.';
    END IF;
END$$

DROP PROCEDURE IF EXISTS GetTodayAttendance$$
CREATE PROCEDURE GetTodayAttendance(
    IN p_UserId INT,
    IN p_Date DATE
)
BEGIN
    SELECT AttendanceId, UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
           WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status
    FROM Attendance
    WHERE UserId = p_UserId
      AND DATE(Date) = p_Date
    LIMIT 1;
END$$

DROP PROCEDURE IF EXISTS GetEmployeeAttendanceHistory$$
CREATE PROCEDURE GetEmployeeAttendanceHistory(
    IN p_UserId INT,
    IN p_FromDate DATE,
    IN p_ToDate DATE,
    IN p_Status VARCHAR(50),
    IN p_Sort VARCHAR(20)
)
BEGIN
    IF LOWER(COALESCE(p_Sort, 'newest')) = 'oldest' THEN
        SELECT AttendanceId, UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
               WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status
        FROM Attendance
        WHERE UserId = p_UserId
          AND (p_FromDate IS NULL OR DATE(Date) >= p_FromDate)
          AND (p_ToDate IS NULL OR DATE(Date) <= p_ToDate)
          AND (p_Status IS NULL OR p_Status = '' OR p_Status = 'All Status' OR Status = p_Status)
        ORDER BY Date ASC;
    ELSEIF LOWER(COALESCE(p_Sort, 'newest')) = 'present' THEN
        SELECT AttendanceId, UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
               WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status
        FROM Attendance
        WHERE UserId = p_UserId
          AND (p_FromDate IS NULL OR DATE(Date) >= p_FromDate)
          AND (p_ToDate IS NULL OR DATE(Date) <= p_ToDate)
          AND (p_Status IS NULL OR p_Status = '' OR p_Status = 'All Status' OR Status = p_Status)
        ORDER BY CASE WHEN Status = 'Present' THEN 0 ELSE 1 END, Date DESC;
    ELSEIF LOWER(COALESCE(p_Sort, 'newest')) = 'absent' THEN
        SELECT AttendanceId, UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
               WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status
        FROM Attendance
        WHERE UserId = p_UserId
          AND (p_FromDate IS NULL OR DATE(Date) >= p_FromDate)
          AND (p_ToDate IS NULL OR DATE(Date) <= p_ToDate)
          AND (p_Status IS NULL OR p_Status = '' OR p_Status = 'All Status' OR Status = p_Status)
        ORDER BY CASE WHEN Status = 'Absent' THEN 0 ELSE 1 END, Date DESC;
    ELSE
        SELECT AttendanceId, UserId, Date, CheckIn, CheckOut, LunchIn, LunchOut,
               WorkingHours, ProductionHours, OvertimeHours, BreakHours, Late, Status
        FROM Attendance
        WHERE UserId = p_UserId
          AND (p_FromDate IS NULL OR DATE(Date) >= p_FromDate)
          AND (p_ToDate IS NULL OR DATE(Date) <= p_ToDate)
          AND (p_Status IS NULL OR p_Status = '' OR p_Status = 'All Status' OR Status = p_Status)
        ORDER BY Date DESC;
    END IF;
END$$

DROP PROCEDURE IF EXISTS GetEmployeeAttendanceSummary$$
CREATE PROCEDURE GetEmployeeAttendanceSummary(
    IN p_UserId INT,
    IN p_Date DATE
)
BEGIN
    SELECT
        COALESCE(SUM(CASE WHEN DATE(Date) = p_Date THEN WorkingHours ELSE 0 END), 0.00) AS TodayWorkingHours,
        COALESCE(SUM(CASE WHEN YEARWEEK(Date, 1) = YEARWEEK(p_Date, 1) THEN WorkingHours ELSE 0 END), 0.00) AS WeekWorkingHours,
        COALESCE(SUM(CASE WHEN YEAR(Date) = YEAR(p_Date) AND MONTH(Date) = MONTH(p_Date) THEN WorkingHours ELSE 0 END), 0.00) AS MonthWorkingHours,
        COALESCE(SUM(CASE WHEN YEAR(Date) = YEAR(p_Date) AND MONTH(Date) = MONTH(p_Date) THEN OvertimeHours ELSE 0 END), 0.00) AS MonthOvertimeHours,
        COALESCE(SUM(CASE WHEN DATE(Date) = p_Date THEN ProductionHours ELSE 0 END), 0.00) AS TodayProductionHours,
        COALESCE(SUM(CASE WHEN DATE(Date) = p_Date THEN BreakHours ELSE 0 END), 0.00) AS TodayBreakHours,
        COALESCE(SUM(CASE WHEN DATE(Date) = p_Date THEN OvertimeHours ELSE 0 END), 0.00) AS TodayOvertimeHours
    FROM Attendance
    WHERE UserId = p_UserId;
END$$

DELIMITER ;

