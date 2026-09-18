USE pulse360db;

DROP PROCEDURE IF EXISTS AddTermination;
DROP PROCEDURE IF EXISTS GetAllTerminations;
DROP PROCEDURE IF EXISTS GetTerminationById;
DROP PROCEDURE IF EXISTS UpdateTermination;
DROP PROCEDURE IF EXISTS DeleteTermination;

DELIMITER //

CREATE PROCEDURE AddTermination(
    IN p_userId INT,
    IN p_terminationType VARCHAR(100),
    IN p_noticeDate DATETIME,
    IN p_resignDate DATETIME,
    IN p_reason VARCHAR(500)
)
BEGIN
INSERT INTO Termination
(
    UserID,
    TerminationType,
    NoticeDate,
    ResignDate,
    Reason
)
VALUES
    (
        p_userId,
        p_terminationType,
        p_noticeDate,
        p_resignDate,
        p_reason
    );
END //

CREATE PROCEDURE GetAllTerminations()
BEGIN
SELECT
    t.TerminationId,
    t.UserID,
    t.TerminationType,
    t.NoticeDate,
    t.ResignDate,
    t.Reason,
    u.FirstName,
    u.LastName,
    d.Name AS Department
FROM Termination t
         INNER JOIN User u
                    ON t.UserID = u.UserId
         INNER JOIN Departments d
                    ON u.DepartmentId = d.DepartmentId
ORDER BY t.ResignDate DESC;
END //

CREATE PROCEDURE GetTerminationById(
    IN p_terminationId INT
)
BEGIN
SELECT
    TerminationId,
    UserID,
    TerminationType,
    NoticeDate,
    ResignDate,
    Reason
FROM Termination
WHERE TerminationId = p_terminationId;
END //

CREATE PROCEDURE UpdateTermination(
    IN p_terminationId INT,
    IN p_userId INT,
    IN p_terminationType VARCHAR(100),
    IN p_noticeDate DATETIME,
    IN p_resignDate DATETIME,
    IN p_reason VARCHAR(500)
)
BEGIN
UPDATE Termination
SET
    UserID = p_userId,
    TerminationType = p_terminationType,
    NoticeDate = p_noticeDate,
    ResignDate = p_resignDate,
    Reason = p_reason
WHERE TerminationId = p_terminationId;
END //

CREATE PROCEDURE DeleteTermination(
    IN p_terminationId INT
)
BEGIN
DELETE FROM Termination
WHERE TerminationId = p_terminationId;
END //

DELIMITER ;
