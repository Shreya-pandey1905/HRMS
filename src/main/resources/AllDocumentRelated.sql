USE Pulse360Db;

-- =========================================================
-- 1. GetUserByEmail
-- =========================================================

DROP PROCEDURE IF EXISTS GetUserByEmail;

DELIMITER //

CREATE PROCEDURE GetUserByEmail(IN p_email VARCHAR(255))
BEGIN
    SELECT UserId, Email, PasswordHash, RoleId, Status
    FROM `User`
    WHERE Email = p_email;
END //

DELIMITER ;


-- =========================================================
-- 2. GetRoleById
-- =========================================================

DROP PROCEDURE IF EXISTS GetRoleById;

DELIMITER //

CREATE PROCEDURE GetRoleById(IN p_roleId INT)
BEGIN
    SELECT RoleId, RoleName, Status
    FROM `Role`
    WHERE RoleId = p_roleId;
END //

DELIMITER ;


-- =========================================================
-- 3. GetAllAdminDocNames
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllAdminDocNames;

DELIMITER //

CREATE PROCEDURE GetAllAdminDocNames()
BEGIN
    SELECT Id, DocName
    FROM addadmindocnames;
END //

DELIMITER ;


-- =========================================================
-- 4. AddAdminDocName
-- =========================================================

DROP PROCEDURE IF EXISTS AddAdminDocName;

DELIMITER //

CREATE PROCEDURE AddAdminDocName(IN p_docName VARCHAR(255))
BEGIN
    INSERT INTO addadmindocnames (DocName)
    VALUES (p_docName);
END //

DELIMITER ;


-- =========================================================
-- 5. GetAllEmployeeDocNames
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllEmployeeDocNames;

DELIMITER //

CREATE PROCEDURE GetAllEmployeeDocNames()
BEGIN
    SELECT Id, DocName
    FROM addemployeedocnames;
END //

DELIMITER ;


-- =========================================================
-- 6. AddEmployeeDocName
-- =========================================================

DROP PROCEDURE IF EXISTS AddEmployeeDocName;

DELIMITER //

CREATE PROCEDURE AddEmployeeDocName(IN p_docName VARCHAR(255))
BEGIN
    INSERT INTO addemployeedocnames (DocName)
    VALUES (p_docName);
END //

DELIMITER ;


-- =========================================================
-- 7. DeleteEmployeeDocName
-- =========================================================

DROP PROCEDURE IF EXISTS DeleteEmployeeDocName;

DELIMITER //

CREATE PROCEDURE DeleteEmployeeDocName(IN p_id INT)
BEGIN
    DELETE FROM addemployeedocnames
    WHERE Id = p_id;
END //

DELIMITER ;


-- =========================================================
-- 8. GetAllAdminDocuments
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllAdminDocuments;

DELIMITER //

CREATE PROCEDURE GetAllAdminDocuments()
BEGIN
    SELECT
        a.AdminDocId,
        a.Email,
        a.DocName,
        a.DocFile,
        CONCAT(
            u.FirstName,
            ' ',
            u.LastName
        ) AS EmployeeName
    FROM admindocuments a
    LEFT JOIN `user` u
        ON a.Email = u.Email
    ORDER BY a.AdminDocId DESC;
END //

DELIMITER ;


-- =========================================================
-- 9. AddAdminDocument
-- =========================================================

DROP PROCEDURE IF EXISTS AddAdminDocument;

DELIMITER //

CREATE PROCEDURE AddAdminDocument(
    IN p_email VARCHAR(255),
    IN p_docName VARCHAR(255),
    IN p_docFile VARCHAR(500)
)
BEGIN
    INSERT INTO admindocuments
    (
        Email,
        DocName,
        DocFile
    )
    VALUES
    (
        p_email,
        p_docName,
        p_docFile
    );
END //

DELIMITER ;


-- =========================================================
-- 10. DeleteAdminDocument
-- =========================================================

DROP PROCEDURE IF EXISTS DeleteAdminDocument;

DELIMITER //

CREATE PROCEDURE DeleteAdminDocument(IN p_adminDocId INT)
BEGIN
    DELETE FROM admindocuments
    WHERE AdminDocId = p_adminDocId;
END //

DELIMITER ;


-- =========================================================
-- 11. GetAllUploadedFiles
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllUploadedFiles;

DELIMITER //

CREATE PROCEDURE GetAllUploadedFiles()
BEGIN
    SELECT
        Id,
        FileName,
        FilePath,
        UserId
    FROM fileuploads;
END //

DELIMITER ;


-- =========================================================
-- 12. AddUploadedFile
-- =========================================================

DROP PROCEDURE IF EXISTS AddUploadedFile;

DELIMITER //

CREATE PROCEDURE AddUploadedFile(
    IN p_fileName VARCHAR(255),
    IN p_filePath VARCHAR(500),
    IN p_userId INT
)
BEGIN
    INSERT INTO fileuploads
    (
        FileName,
        FilePath,
        UserId
    )
    VALUES
    (
        p_fileName,
        p_filePath,
        p_userId
    );
END //

DELIMITER ;


-- =========================================================
-- 13. DeleteUploadedFile
-- =========================================================

DROP PROCEDURE IF EXISTS DeleteUploadedFile;

DELIMITER //

CREATE PROCEDURE DeleteUploadedFile(IN p_id INT)
BEGIN
    DELETE FROM fileuploads
    WHERE Id = p_id;
END //

DELIMITER ;


-- =========================================================
-- 14. UpdateAdminDocName
-- =========================================================

DROP PROCEDURE IF EXISTS UpdateAdminDocName;

DELIMITER //

CREATE PROCEDURE UpdateAdminDocName(
    IN p_id INT,
    IN p_docName VARCHAR(255)
)
BEGIN
    UPDATE addadmindocnames
    SET DocName = p_docName
    WHERE Id = p_id;
END //

DELIMITER ;


-- =========================================================
-- 15. AssignEmployeeDocument
-- =========================================================

DROP PROCEDURE IF EXISTS AssignEmployeeDocument;

DELIMITER //

CREATE PROCEDURE AssignEmployeeDocument(
    IN p_userId INT,
    IN p_documentId INT
)
BEGIN
    INSERT INTO employee_document_assignments
    (
        UserId,
        DocumentId,
        Status
    )
    VALUES
    (
        p_userId,
        p_documentId,
        'PENDING'
    );
END //

DELIMITER ;


-- =========================================================
-- 16. GetPendingEmployeeDocuments
-- =========================================================

DROP PROCEDURE IF EXISTS GetPendingEmployeeDocuments;

DELIMITER //

CREATE PROCEDURE GetPendingEmployeeDocuments(
    IN p_userId INT
)
BEGIN
    SELECT
        a.AssignmentId,
        a.UserId,
        a.DocumentId,
        d.DocName,
        a.Status,
        a.AssignedAt
    FROM employee_document_assignments a
    INNER JOIN addemployeedocnames d
        ON a.DocumentId = d.Id
    WHERE a.UserId = p_userId
      AND a.Status = 'PENDING'
    ORDER BY a.AssignedAt DESC;
END //

DELIMITER ;


-- =========================================================
-- 17. AddEmployeeDocument
-- =========================================================

DROP PROCEDURE IF EXISTS AddEmployeeDocument;

DELIMITER //

CREATE PROCEDURE AddEmployeeDocument(
    IN p_fileName VARCHAR(255),
    IN p_filePath VARCHAR(500),
    IN p_userId INT,
    IN p_documentId INT
)
BEGIN
    INSERT INTO fileuploads
    (
        FileName,
        FilePath,
        UserId,
        DocumentId
    )
    VALUES
    (
        p_fileName,
        p_filePath,
        p_userId,
        p_documentId
    );
END //

DELIMITER ;


-- =========================================================
-- 18. MarkEmployeeDocumentSubmitted
-- =========================================================

DROP PROCEDURE IF EXISTS MarkEmployeeDocumentSubmitted;

DELIMITER //

CREATE PROCEDURE MarkEmployeeDocumentSubmitted(
    IN p_userId INT,
    IN p_documentId INT
)
BEGIN
    UPDATE employee_document_assignments
    SET
        Status = 'SUBMITTED',
        SubmittedAt = CURRENT_TIMESTAMP
    WHERE UserId = p_userId
      AND DocumentId = p_documentId
      AND Status = 'PENDING';
END //

DELIMITER ;


-- =========================================================
-- 19. GetAllEmployeeDocumentAssignments
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllEmployeeDocumentAssignments;

DELIMITER //

CREATE PROCEDURE GetAllEmployeeDocumentAssignments()
BEGIN
    SELECT
        a.AssignmentId,
        a.UserId,
        a.DocumentId,
        CONCAT(
            u.FirstName,
            ' ',
            u.LastName
        ) AS EmployeeName,
        d.DocName AS DocumentName
    FROM employee_document_assignments a
    INNER JOIN `user` u
        ON a.UserId = u.UserId
    INNER JOIN addemployeedocnames d
        ON a.DocumentId = d.Id
    ORDER BY a.AssignmentId DESC;
END //

DELIMITER ;


-- =========================================================
-- 20. GetAllEmployeeDocuments
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllEmployeeDocuments;

DELIMITER //

CREATE PROCEDURE GetAllEmployeeDocuments()
BEGIN
    SELECT
        f.id,
        f.FileName,
        f.FilePath,
        f.UserId,
        f.DocumentId,
        d.DocName,
        u.FirstName,
        u.LastName,
        u.Email
    FROM fileuploads f
    LEFT JOIN addemployeedocnames d
        ON f.DocumentId = d.Id
    INNER JOIN `user` u
        ON f.UserId = u.UserId
    ORDER BY f.id DESC;
END //

DELIMITER ;


-- =========================================================
-- 21. DeleteEmployeeDocument
-- =========================================================

DROP PROCEDURE IF EXISTS DeleteEmployeeDocument;

DELIMITER //

CREATE PROCEDURE DeleteEmployeeDocument(
    IN p_id INT
)
BEGIN
    DELETE FROM fileuploads
    WHERE id = p_id;
END //

DELIMITER ;


-- =========================================================
-- 22. GetAllEmployees
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllEmployees;

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT
        UserId,
        FirstName,
        LastName,
        Email
    FROM `user`
    ORDER BY FirstName, LastName;
END //

DELIMITER ;


-- =========================================================
-- 23. GetEmployeeCompanyLetters
-- =========================================================

DROP PROCEDURE IF EXISTS GetEmployeeCompanyLetters;

DELIMITER //

CREATE PROCEDURE GetEmployeeCompanyLetters(
    IN p_userId INT
)
BEGIN
    SELECT
        g.GeneratedLetterId,
        g.UserId,
        g.LetterName,
        g.LetterFile,
        g.GeneratedDate
    FROM generated_letters g
    WHERE g.UserId = p_userId
    ORDER BY g.GeneratedLetterId DESC;
END //

DELIMITER ;


-- =========================================================
-- 24. AddGeneratedLetter
-- =========================================================

DROP PROCEDURE IF EXISTS AddGeneratedLetter;

DELIMITER //

CREATE PROCEDURE AddGeneratedLetter(
    IN p_userId INT,
    IN p_letterName VARCHAR(255),
    IN p_letterFile VARCHAR(500)
)
BEGIN
    INSERT INTO generated_letters
    (
        UserId,
        LetterName,
        LetterFile
    )
    VALUES
    (
        p_userId,
        p_letterName,
        p_letterFile
    );
END //

DELIMITER ;


-- =========================================================
-- 25. GetAllGeneratedLetters
-- =========================================================

DROP PROCEDURE IF EXISTS GetAllGeneratedLetters;

DELIMITER //

CREATE PROCEDURE GetAllGeneratedLetters()
BEGIN
    SELECT
        g.GeneratedLetterId,
        g.UserId,
        CONCAT(
            u.FirstName,
            ' ',
            u.LastName
        ) AS EmployeeName,
        u.Email,
        g.LetterName,
        g.LetterFile,
        g.GeneratedDate
    FROM generated_letters g
    INNER JOIN `user` u
        ON g.UserId = u.UserId
    ORDER BY g.GeneratedLetterId DESC;
END //

DELIMITER ;


-- =========================================================
-- 26. DeleteGeneratedLetter
-- =========================================================

DROP PROCEDURE IF EXISTS DeleteGeneratedLetter;

DELIMITER //

CREATE PROCEDURE DeleteGeneratedLetter(
    IN p_generatedLetterId INT
)
BEGIN
    DELETE FROM generated_letters
    WHERE GeneratedLetterId = p_generatedLetterId;
END //

DELIMITER ;


-- =========================================================
-- CHECK ALL PROCEDURES
-- =========================================================

SHOW PROCEDURE STATUS
WHERE Db = 'Pulse360Db';