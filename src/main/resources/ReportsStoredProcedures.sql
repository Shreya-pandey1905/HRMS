-- Stored procedures for the Reports work done this round:
-- Attendance Report, Leave Report, Project Report, Employee Report,
-- Payslip Report, Task Report, Daily Report.
-- Nothing else from "SP(aK) documentation" is included here on purpose -
-- this file is scoped to just the reports part.
--
-- No BEGIN...END or DELIMITER needed: every body here is a single
-- statement, which MySQL allows as a plain procedure body. Safe to
-- paste-and-execute as-is in any client (Workbench included).

USE Pulse360Db;

DROP PROCEDURE IF EXISTS GetAttendanceReport;
CREATE PROCEDURE GetAttendanceReport()
    SELECT
        a.AttendanceId,
        a.UserId,
        CONCAT(u.FirstName, ' ', u.LastName) AS EmployeeName,
        a.Date,
        a.CheckIn,
        a.CheckOut,
        a.LunchIn,
        a.LunchOut,
        a.WorkingHours,
        a.ProductionHours,
        a.OvertimeHours,
        a.BreakHours,
        a.Late,
        a.Status
    FROM Attendance a
    INNER JOIN User u
        ON a.UserId = u.UserId
    ORDER BY a.Date DESC;

DROP PROCEDURE IF EXISTS GetLeaveReport;
CREATE PROCEDURE GetLeaveReport()
    SELECT
        l.LeaveRequestId,
        l.UserId,
        CONCAT(u.FirstName, ' ', u.LastName) AS EmployeeName,
        l.LeaveTypeId,
        m.LeaveType,
        l.StartDate,
        l.EndDate,
        l.NumberOfDays,
        l.Reason,
        l.ApprovedBy,
        l.Status,
        l.StatusHistory
    FROM LeaveRequests l
    INNER JOIN User u
        ON l.UserId = u.UserId
    INNER JOIN MasterLeaveTypes m
        ON l.LeaveTypeId = m.LeaveTypeId
    ORDER BY l.StartDate DESC;

DROP PROCEDURE IF EXISTS GetProjectReport;
CREATE PROCEDURE GetProjectReport()
    SELECT
        p.ProjectId,
        p.ProjectName,
        p.ClientName,
        p.ManagerName,
        p.StartDate,
        p.EndDate,
        p.Priority,
        p.Status,
        GROUP_CONCAT(CONCAT(u.FirstName, ' ', u.LastName) SEPARATOR ', ') AS Members
    FROM AllProjects p
    LEFT JOIN ProjectsUser pu
        ON p.ProjectId = pu.ProjectsProjectId
    LEFT JOIN User u
        ON pu.UsersUserId = u.UserId
    GROUP BY
        p.ProjectId, p.ProjectName, p.ClientName, p.ManagerName,
        p.StartDate, p.EndDate, p.Priority, p.Status
    ORDER BY p.StartDate DESC;

DROP PROCEDURE IF EXISTS GetEmployeeReport;
CREATE PROCEDURE GetEmployeeReport()
    SELECT
        u.UserId,
        CONCAT(u.FirstName, ' ', u.LastName) AS EmployeeName,
        u.Email,
        d.Name AS DepartmentName,
        u.PhoneNumber,
        u.DateOfJoining,
        u.Status
    FROM User u
    LEFT JOIN Departments d
        ON u.DepartmentId = d.DepartmentId
    ORDER BY u.DateOfJoining DESC;

DROP PROCEDURE IF EXISTS GetPayslipReport;
CREATE PROCEDURE GetPayslipReport()
    SELECT
        p.PayslipId,
        CONCAT(u.FirstName, ' ', u.LastName) AS EmployeeName,
        s.NetSalary AS PaidAmount,
        p.Month AS PaidMonth,
        p.Year AS PaidYear
    FROM Payslips p
    INNER JOIN User u
        ON p.UserId = u.UserId
    LEFT JOIN EmployeeSalaries s
        ON p.UserId = s.UserId
    ORDER BY p.GeneratedOn DESC;

DROP PROCEDURE IF EXISTS GetTaskReport;
CREATE PROCEDURE GetTaskReport()
    SELECT
        t.TaskId,
        t.Title AS TaskName,
        pr.ProjectName,
        t.Deadline,
        t.Priority,
        t.Status
    FROM Task t
    INNER JOIN AllProjects pr
        ON t.ProjectId = pr.ProjectId
    ORDER BY t.Deadline DESC;

DROP PROCEDURE IF EXISTS GetDailyReport;
CREATE PROCEDURE GetDailyReport()
    SELECT
        a.AttendanceId,
        CONCAT(u.FirstName, ' ', u.LastName) AS EmployeeName,
        a.Date,
        d.Name AS DepartmentName,
        a.Status
    FROM Attendance a
    INNER JOIN User u
        ON a.UserId = u.UserId
    LEFT JOIN Departments d
        ON u.DepartmentId = d.DepartmentId
    WHERE a.Date = (SELECT MAX(Date) FROM Attendance)
    ORDER BY u.FirstName;
