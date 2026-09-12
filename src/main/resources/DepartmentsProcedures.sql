
-- Departments Procedure

DELIMITER //

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

CREATE PROCEDURE DeleteDepartment(
    IN p_departmentid INT
)
BEGIN
    DELETE FROM departments
    WHERE departmentid = p_departmentid;
END //

DELIMITER ;


