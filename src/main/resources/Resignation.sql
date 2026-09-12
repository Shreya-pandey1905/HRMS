USE pulse360db;

DROP PROCEDURE IF EXISTS AddResignation;

DELIMITER //

CREATE PROCEDURE AddResignation(
    IN p_userId INT,
    IN p_noticeDate DATETIME,
    IN p_reason VARCHAR(500),
    IN p_resignDate DATETIME
)
BEGIN

INSERT INTO resignation
(
    UserID,
    DepartmentId,
    NoticeDate,
    Reason,
    ResignDate
)
SELECT
    u.UserId,
    u.DepartmentId,
    p_noticeDate,
    p_reason,
    p_resignDate
FROM User u
WHERE u.UserId = p_userId;

END //

DELIMITER ;

DROP PROCEDURE IF EXISTS GetAllResignations;
DELIMITER //
CREATE PROCEDURE GetAllResignations()
BEGIN
SELECT
    r.ResignationId,
    r.UserID,
    r.DepartmentId,
    u.FirstName,
    u.LastName,
    d.Name AS Department,
    r.NoticeDate,
    r.Reason,
    r.ResignDate
FROM resignation r
         INNER JOIN User u
                    ON r.UserID = u.UserId
         INNER JOIN Departments d
                    ON r.DepartmentId = d.DepartmentId
ORDER BY r.ResignDate DESC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS GetResignationById;
DELIMITER //
CREATE PROCEDURE GetResignationById(
    IN p_resignationId INT
)
BEGIN
SELECT
    ResignationId,
    UserID,
    DepartmentId,
    NoticeDate,
    Reason,
    ResignDate
FROM resignation
WHERE ResignationId = p_resignationId;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS UpdateResignation;

DELIMITER //

CREATE PROCEDURE UpdateResignation(
    IN p_resignationId INT,
    IN p_userId INT,
    IN p_noticeDate DATETIME,
    IN p_reason VARCHAR(500),
    IN p_resignDate DATETIME
)
BEGIN

UPDATE resignation r

    JOIN User u
ON u.UserId = p_userId

    SET
        r.UserID = p_userId,
        r.DepartmentId = u.DepartmentId,
        r.NoticeDate = p_noticeDate,
        r.Reason = p_reason,
        r.ResignDate = p_resignDate

WHERE r.ResignationId = p_resignationId;

END //

DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteResignation;
DELIMITER //
CREATE PROCEDURE DeleteResignation(
    IN p_resignationId INT
)
BEGIN
DELETE FROM resignation
WHERE ResignationId = p_resignationId;
END //
DELIMITER ;
