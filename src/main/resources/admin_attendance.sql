-- ============================================================
-- Pulse360 HRMS - Admin Attendance
-- New procedures only. Existing attendance procedures are not changed.
-- Run after User, Role, Departments and Attendance tables exist.
-- ============================================================

USE `pulse360db`;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetAdminAttendance$$
CREATE PROCEDURE GetAdminAttendance(
    IN p_FromDate DATE,
    IN p_ToDate DATE,
    IN p_DepartmentId INT,
    IN p_Status VARCHAR(50),
    IN p_Sort VARCHAR(30)
)
BEGIN
    DECLARE v_FromDate DATE;
    DECLARE v_ToDate DATE;

    SET v_FromDate = COALESCE(p_FromDate, CURDATE());
    SET v_ToDate = COALESCE(p_ToDate, v_FromDate);

    WITH RECURSIVE date_range AS (
        SELECT v_FromDate AS AttendanceDate
        UNION ALL
        SELECT DATE_ADD(AttendanceDate, INTERVAL 1 DAY)
        FROM date_range
        WHERE AttendanceDate < v_ToDate
    ),
    employee_days AS (
        SELECT
            u.UserId,
            u.FirstName,
            u.LastName,
            u.DepartmentId,
            u.ProfilePicture,
            d.Name AS DepartmentName,
            dr.AttendanceDate
        FROM `User` u
        LEFT JOIN Departments d ON d.DepartmentId = u.DepartmentId
        CROSS JOIN date_range dr
        WHERE (u.Status IS NULL OR LOWER(u.Status) IN ('active', 'present', ''))
    )
    SELECT
        a.AttendanceId,
        ed.UserId,
        ed.FirstName,
        ed.LastName,
        ed.DepartmentName,
        ed.ProfilePicture,
        CAST(ed.AttendanceDate AS DATETIME) AS AttendanceDate,
        a.CheckIn,
        a.CheckOut,
        COALESCE(a.BreakHours, 0.00) AS BreakHours,
        COALESCE(a.Late, 0) AS Late,
        COALESCE(a.ProductionHours, 0.00) AS ProductionHours,
        COALESCE(a.WorkingHours, 0.00) AS WorkingHours,
        COALESCE(a.OvertimeHours, 0.00) AS OvertimeHours,
        CASE
            WHEN a.AttendanceId IS NULL THEN 'Absent'
            ELSE COALESCE(a.Status, 'Present')
        END AS AttendanceStatus
    FROM employee_days ed
    LEFT JOIN Attendance a
        ON a.UserId = ed.UserId
       AND DATE(a.Date) = ed.AttendanceDate
    WHERE (p_DepartmentId IS NULL OR ed.DepartmentId = p_DepartmentId)
      AND (
            p_Status IS NULL OR p_Status = '' OR LOWER(p_Status) = 'all'
            OR (p_Status = 'Absent' AND a.AttendanceId IS NULL)
            OR (p_Status <> 'Absent' AND a.AttendanceId IS NOT NULL AND a.Status = p_Status)
          )
    ORDER BY
        CASE WHEN LOWER(COALESCE(p_Sort, 'recent')) = 'nameasc' THEN ed.FirstName END ASC,
        CASE WHEN LOWER(COALESCE(p_Sort, 'recent')) = 'namedesc' THEN ed.FirstName END DESC,
        CASE WHEN LOWER(COALESCE(p_Sort, 'recent')) IN ('recent', 'last7days', 'lastmonth') THEN ed.AttendanceDate END DESC,
        ed.LastName ASC,
        ed.UserId ASC;
END$$

DROP PROCEDURE IF EXISTS GetAdminAttendanceTodaySummary$$
CREATE PROCEDURE GetAdminAttendanceTodaySummary(IN p_Date DATE)
BEGIN
    SELECT
        COUNT(*) AS TotalEmployees,
        SUM(CASE WHEN a.AttendanceId IS NOT NULL AND COALESCE(a.Status, 'Present') = 'Present' THEN 1 ELSE 0 END) AS PresentCount,
        SUM(CASE WHEN a.AttendanceId IS NOT NULL AND COALESCE(a.Late, 0) > 0 THEN 1 ELSE 0 END) AS LateCount,
        SUM(CASE WHEN a.AttendanceId IS NOT NULL AND LOWER(COALESCE(a.Status, '')) = 'permission' THEN 1 ELSE 0 END) AS PermissionCount,
        SUM(CASE WHEN a.AttendanceId IS NULL THEN 1 ELSE 0 END) AS AbsentCount
    FROM `User` u
    LEFT JOIN Attendance a
        ON a.UserId = u.UserId
       AND DATE(a.Date) = p_Date
    WHERE (u.Status IS NULL OR LOWER(u.Status) IN ('active', 'present', ''));
END$$

DELIMITER ;
