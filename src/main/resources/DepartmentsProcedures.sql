-- Departments Procedures

DELIMITER //

DROP PROCEDURE IF EXISTS AddDepartment //
CREATE PROCEDURE AddDepartment(
    IN p_name LONGTEXT,
    IN p_status LONGTEXT,
    IN p_createdby VARCHAR(255)
)
BEGIN
INSERT INTO departments
(name, noofemployee, status, createdat, createdby)
VALUES
    (p_name, 0, p_status, NOW(), p_createdby);
END //


DROP PROCEDURE IF EXISTS GetAllDepartments //
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


DROP PROCEDURE IF EXISTS GetDepartmentById //
CREATE PROCEDURE GetDepartmentById(
    IN p_departmentid INT
)
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
WHERE departmentid = p_departmentid;
END //


DROP PROCEDURE IF EXISTS UpdateDepartment //
CREATE PROCEDURE UpdateDepartment(
    IN p_departmentid INT,
    IN p_name LONGTEXT,
    IN p_status LONGTEXT,
    IN p_modifiedby VARCHAR(255)
)
BEGIN
UPDATE departments
SET name = p_name,
    status = p_status,
    modifiedby = p_modifiedby,
    modifiedat = NOW()
WHERE departmentid = p_departmentid;
END //


DROP PROCEDURE IF EXISTS DeleteDepartment //
CREATE PROCEDURE DeleteDepartment(
    IN p_departmentid INT
)
BEGIN
DELETE FROM departments
WHERE departmentid = p_departmentid;
END //

DELIMITER ;



DROP PROCEDURE IF EXISTS DeleteDepartment;

DELIMITER //

CREATE PROCEDURE DeleteDepartment(
    IN p_departmentid INT
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deduction
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM departmentleaves
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM designations
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM earning
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM performanceappriasal
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM performanceindicators
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM resignation
        WHERE DepartmentId = p_departmentid
    )
    OR EXISTS (
        SELECT 1
        FROM user
        WHERE DepartmentId = p_departmentid
    )
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department is being used and cannot be deleted';
ELSE
DELETE FROM departments
WHERE DepartmentId = p_departmentid;
END IF;
END //

DELIMITER ;
