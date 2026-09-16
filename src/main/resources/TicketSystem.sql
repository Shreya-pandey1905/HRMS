-- =============================================================
-- HRMS TICKET SYSTEM
-- Based on: Sender Employee -> Manager -> Assigned Employee
-- -> Solution -> Closed / Reopened
--
-- IMPORTANT:
-- This script replaces the OLD Tickets/TicketReplies demo tables because
-- their columns do not match the requested ticket workflow.
-- Back up those two tables first if you need their old sample data.
-- =============================================================

USE Pulse360Db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `TicketHistory`;
DROP TABLE IF EXISTS `TicketAttachment`;
DROP TABLE IF EXISTS `TicketResolution`;
DROP TABLE IF EXISTS `TicketComment`;
DROP TABLE IF EXISTS `TicketReplies`;
DROP TABLE IF EXISTS `Tickets`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Tickets` (
                           `TicketId` INT NOT NULL AUTO_INCREMENT,
                           `TicketNo` VARCHAR(30) NULL,
                           `Subject` VARCHAR(200) NOT NULL,
                           `Description` LONGTEXT NOT NULL,
                           `Priority` VARCHAR(20) NOT NULL,
                           `RaisedBy` INT NOT NULL,
                           `AssignedTo` INT NULL,
                           `AssignedBy` INT NULL,
                           `Status` VARCHAR(30) NOT NULL DEFAULT 'Open',
                           `CreatedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `AssignedDate` DATETIME NULL,
                           `StartedDate` DATETIME NULL,
                           `ResolvedDate` DATETIME NULL,
                           `ClosedDate` DATETIME NULL,
                           PRIMARY KEY (`TicketId`),
                           UNIQUE KEY `UQ_Tickets_TicketNo` (`TicketNo`),
                           KEY `IX_Tickets_RaisedBy` (`RaisedBy`),
                           KEY `IX_Tickets_AssignedTo` (`AssignedTo`),
                           KEY `IX_Tickets_AssignedBy` (`AssignedBy`),
                           KEY `IX_Tickets_Status` (`Status`),
                           CONSTRAINT `FK_Tickets_User_RaisedBy`
                               FOREIGN KEY (`RaisedBy`) REFERENCES `User` (`UserId`),
                           CONSTRAINT `FK_Tickets_User_AssignedTo`
                               FOREIGN KEY (`AssignedTo`) REFERENCES `User` (`UserId`),
                           CONSTRAINT `FK_Tickets_User_AssignedBy`
                               FOREIGN KEY (`AssignedBy`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TicketComment` (
                                 `CommentId` INT NOT NULL AUTO_INCREMENT,
                                 `TicketId` INT NOT NULL,
                                 `CommentBy` INT NOT NULL,
                                 `CommentText` LONGTEXT NOT NULL,
                                 `CommentDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`CommentId`),
                                 KEY `IX_TicketComment_TicketId` (`TicketId`),
                                 CONSTRAINT `FK_TicketComment_Tickets_TicketId`
                                     FOREIGN KEY (`TicketId`) REFERENCES `Tickets` (`TicketId`) ON DELETE CASCADE,
                                 CONSTRAINT `FK_TicketComment_User_CommentBy`
                                     FOREIGN KEY (`CommentBy`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TicketResolution` (
                                    `ResolutionId` INT NOT NULL AUTO_INCREMENT,
                                    `TicketId` INT NOT NULL,
                                    `ResolvedBy` INT NOT NULL,
                                    `Solution` LONGTEXT NOT NULL,
                                    `ResolutionNotes` LONGTEXT NULL,
                                    `ResolvedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    PRIMARY KEY (`ResolutionId`),
                                    UNIQUE KEY `UQ_TicketResolution_TicketId` (`TicketId`),
                                    CONSTRAINT `FK_TicketResolution_Tickets_TicketId`
                                        FOREIGN KEY (`TicketId`) REFERENCES `Tickets` (`TicketId`) ON DELETE CASCADE,
                                    CONSTRAINT `FK_TicketResolution_User_ResolvedBy`
                                        FOREIGN KEY (`ResolvedBy`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TicketAttachment` (
                                    `AttachmentId` INT NOT NULL AUTO_INCREMENT,
                                    `TicketId` INT NOT NULL,
                                    `FileName` VARCHAR(255) NOT NULL,
                                    `StoredName` VARCHAR(255) NOT NULL,
                                    `FilePath` VARCHAR(1000) NOT NULL,
                                    `ContentType` VARCHAR(150) NULL,
                                    `AttachmentType` VARCHAR(30) NOT NULL,
                                    `UploadedBy` INT NOT NULL,
                                    `UploadedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    PRIMARY KEY (`AttachmentId`),
                                    KEY `IX_TicketAttachment_TicketId` (`TicketId`),
                                    CONSTRAINT `FK_TicketAttachment_Tickets_TicketId`
                                        FOREIGN KEY (`TicketId`) REFERENCES `Tickets` (`TicketId`) ON DELETE CASCADE,
                                    CONSTRAINT `FK_TicketAttachment_User_UploadedBy`
                                        FOREIGN KEY (`UploadedBy`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- The supplied Word file references TicketHistory in the relationships section
-- but does not define its columns. This small implementation table records
-- status changes without changing the requested core ticket tables.
CREATE TABLE `TicketHistory` (
                                 `HistoryId` INT NOT NULL AUTO_INCREMENT,
                                 `TicketId` INT NOT NULL,
                                 `ChangedBy` INT NOT NULL,
                                 `OldStatus` VARCHAR(30) NULL,
                                 `NewStatus` VARCHAR(30) NOT NULL,
                                 `Note` VARCHAR(500) NULL,
                                 `ChangedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`HistoryId`),
                                 KEY `IX_TicketHistory_TicketId` (`TicketId`),
                                 CONSTRAINT `FK_TicketHistory_Tickets_TicketId`
                                     FOREIGN KEY (`TicketId`) REFERENCES `Tickets` (`TicketId`) ON DELETE CASCADE,
                                 CONSTRAINT `FK_TicketHistory_User_ChangedBy`
                                     FOREIGN KEY (`ChangedBy`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER $$

DROP PROCEDURE IF EXISTS `CreateTicket` $$
CREATE PROCEDURE `CreateTicket`(
    IN p_Subject VARCHAR(200),
    IN p_Description LONGTEXT,
    IN p_Priority VARCHAR(20),
    IN p_RaisedBy INT,
    OUT p_TicketId INT,
    OUT p_TicketNo VARCHAR(30)
)
BEGIN
    IF (SELECT COUNT(*) FROM `User` WHERE `UserId` = p_RaisedBy AND `RoleId` = 10) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only an employee can raise a ticket';
END IF;

INSERT INTO `Tickets` (
    `TicketNo`, `Subject`, `Description`, `Priority`, `RaisedBy`, `Status`, `CreatedDate`
) VALUES (
             NULL, p_Subject, p_Description, p_Priority, p_RaisedBy, 'Open', NOW()
         );

SET p_TicketId = LAST_INSERT_ID();
    SET p_TicketNo = CONCAT('TKT-', LPAD(p_TicketId, 5, '0'));

UPDATE `Tickets`
SET `TicketNo` = p_TicketNo
WHERE `TicketId` = p_TicketId;

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_RaisedBy, NULL, 'Open', 'Ticket raised');
END $$

DROP PROCEDURE IF EXISTS `GetTicketsForUser` $$
CREATE PROCEDURE `GetTicketsForUser`(
    IN p_UserId INT,
    IN p_RoleName VARCHAR(50)
)
BEGIN
SELECT
    t.`TicketId`, t.`TicketNo`, t.`Subject`, t.`Description`, t.`Priority`,
    t.`RaisedBy`, t.`AssignedTo`, t.`AssignedBy`, t.`Status`,
    t.`CreatedDate`, t.`AssignedDate`, t.`StartedDate`, t.`ResolvedDate`, t.`ClosedDate`,
    CONCAT_WS(' ', rb.`FirstName`, rb.`LastName`) AS `RaisedByName`,
    CASE WHEN at.`UserId` IS NULL THEN NULL ELSE CONCAT_WS(' ', at.`FirstName`, at.`LastName`) END AS `AssignedToName`,
    CASE WHEN ab.`UserId` IS NULL THEN NULL ELSE CONCAT_WS(' ', ab.`FirstName`, ab.`LastName`) END AS `AssignedByName`
FROM `Tickets` t
         JOIN `User` rb ON rb.`UserId` = t.`RaisedBy`
         LEFT JOIN `User` at ON at.`UserId` = t.`AssignedTo`
    LEFT JOIN `User` ab ON ab.`UserId` = t.`AssignedBy`
WHERE LOWER(p_RoleName) IN ('admin', 'manager')
   OR t.`RaisedBy` = p_UserId
   OR t.`AssignedTo` = p_UserId
ORDER BY
    FIELD(t.`Status`, 'Open', 'Reopened', 'Assigned', 'In Progress', 'Resolved', 'Closed'),
    t.`CreatedDate` DESC;
END $$

DROP PROCEDURE IF EXISTS `GetTicketById` $$
CREATE PROCEDURE `GetTicketById`(IN p_TicketId INT)
BEGIN
SELECT
    t.`TicketId`, t.`TicketNo`, t.`Subject`, t.`Description`, t.`Priority`,
    t.`RaisedBy`, t.`AssignedTo`, t.`AssignedBy`, t.`Status`,
    t.`CreatedDate`, t.`AssignedDate`, t.`StartedDate`, t.`ResolvedDate`, t.`ClosedDate`,
    CONCAT_WS(' ', rb.`FirstName`, rb.`LastName`) AS `RaisedByName`,
    CASE WHEN at.`UserId` IS NULL THEN NULL ELSE CONCAT_WS(' ', at.`FirstName`, at.`LastName`) END AS `AssignedToName`,
    CASE WHEN ab.`UserId` IS NULL THEN NULL ELSE CONCAT_WS(' ', ab.`FirstName`, ab.`LastName`) END AS `AssignedByName`
FROM `Tickets` t
         JOIN `User` rb ON rb.`UserId` = t.`RaisedBy`
         LEFT JOIN `User` at ON at.`UserId` = t.`AssignedTo`
    LEFT JOIN `User` ab ON ab.`UserId` = t.`AssignedBy`
WHERE t.`TicketId` = p_TicketId;
END $$

DROP PROCEDURE IF EXISTS `GetTicketComments` $$
CREATE PROCEDURE `GetTicketComments`(IN p_TicketId INT)
BEGIN
SELECT
    c.`CommentId`, c.`TicketId`, c.`CommentBy`, c.`CommentText`, c.`CommentDate`,
    CONCAT_WS(' ', u.`FirstName`, u.`LastName`) AS `CommentByName`
FROM `TicketComment` c
         JOIN `User` u ON u.`UserId` = c.`CommentBy`
WHERE c.`TicketId` = p_TicketId
ORDER BY c.`CommentDate` ASC, c.`CommentId` ASC;
END $$

DROP PROCEDURE IF EXISTS `GetTicketResolution` $$
CREATE PROCEDURE `GetTicketResolution`(IN p_TicketId INT)
BEGIN
SELECT
    r.`ResolutionId`, r.`TicketId`, r.`ResolvedBy`, r.`Solution`, r.`ResolutionNotes`, r.`ResolvedDate`,
    CONCAT_WS(' ', u.`FirstName`, u.`LastName`) AS `ResolvedByName`
FROM `TicketResolution` r
         JOIN `User` u ON u.`UserId` = r.`ResolvedBy`
WHERE r.`TicketId` = p_TicketId;
END $$

DROP PROCEDURE IF EXISTS `GetTicketAttachments` $$
CREATE PROCEDURE `GetTicketAttachments`(IN p_TicketId INT)
BEGIN
SELECT
    a.`AttachmentId`, a.`TicketId`, a.`FileName`, a.`StoredName`, a.`FilePath`,
    a.`ContentType`, a.`AttachmentType`, a.`UploadedBy`, a.`UploadedDate`,
    CONCAT_WS(' ', u.`FirstName`, u.`LastName`) AS `UploadedByName`
FROM `TicketAttachment` a
         JOIN `User` u ON u.`UserId` = a.`UploadedBy`
WHERE a.`TicketId` = p_TicketId
ORDER BY a.`UploadedDate` ASC, a.`AttachmentId` ASC;
END $$

DROP PROCEDURE IF EXISTS `GetTicketAttachmentById` $$
CREATE PROCEDURE `GetTicketAttachmentById`(IN p_AttachmentId INT)
BEGIN
SELECT
    a.`AttachmentId`, a.`TicketId`, a.`FileName`, a.`StoredName`, a.`FilePath`,
    a.`ContentType`, a.`AttachmentType`, a.`UploadedBy`, a.`UploadedDate`,
    CONCAT_WS(' ', u.`FirstName`, u.`LastName`) AS `UploadedByName`
FROM `TicketAttachment` a
         JOIN `User` u ON u.`UserId` = a.`UploadedBy`
WHERE a.`AttachmentId` = p_AttachmentId;
END $$

DROP PROCEDURE IF EXISTS `GetTicketDashboardCounts` $$
CREATE PROCEDURE `GetTicketDashboardCounts`(
    IN p_UserId INT,
    IN p_RoleName VARCHAR(50)
)
BEGIN
SELECT
    COALESCE(SUM(CASE WHEN t.`Status` IN ('Open', 'Reopened') THEN 1 ELSE 0 END), 0) AS `OpenCount`,
    COALESCE(SUM(CASE WHEN t.`Status` IN ('Assigned', 'In Progress') THEN 1 ELSE 0 END), 0) AS `ActiveCount`,
    COALESCE(SUM(CASE WHEN t.`Status` = 'Resolved' THEN 1 ELSE 0 END), 0) AS `ResolvedCount`,
    COALESCE(SUM(CASE WHEN t.`Status` = 'Closed' THEN 1 ELSE 0 END), 0) AS `ClosedCount`
FROM `Tickets` t
WHERE LOWER(p_RoleName) IN ('admin', 'manager')
   OR t.`RaisedBy` = p_UserId
   OR t.`AssignedTo` = p_UserId;
END $$

DROP PROCEDURE IF EXISTS `GetTicketAssignableEmployees` $$
CREATE PROCEDURE `GetTicketAssignableEmployees`()
BEGIN
SELECT `UserId`, `FirstName`, `LastName`
FROM `User`
WHERE `RoleId` = 10
  AND (`Status` IS NULL OR `Status` = 'Active')
ORDER BY `FirstName`, `LastName`;
END $$

DROP PROCEDURE IF EXISTS `AssignTicket` $$
CREATE PROCEDURE `AssignTicket`(
    IN p_TicketId INT,
    IN p_AssignedBy INT,
    IN p_AssignedTo INT,
    IN p_AssignmentComment LONGTEXT
)
BEGIN
    DECLARE v_OldStatus VARCHAR(30);

SELECT `Status` INTO v_OldStatus
FROM `Tickets`
WHERE `TicketId` = p_TicketId;

IF v_OldStatus IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket not found';
END IF;

    IF v_OldStatus NOT IN ('Open', 'Reopened') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only Open or Reopened tickets can be assigned';
END IF;

    IF (SELECT COUNT(*) FROM `User` WHERE `UserId` = p_AssignedTo AND `RoleId` = 10) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Selected assignee is not an employee';
END IF;

UPDATE `Tickets`
SET `AssignedBy` = p_AssignedBy,
    `AssignedTo` = p_AssignedTo,
    `AssignedDate` = NOW(),
    `StartedDate` = NULL,
    `ResolvedDate` = NULL,
    `ClosedDate` = NULL,
    `Status` = 'Assigned'
WHERE `TicketId` = p_TicketId;

IF p_AssignmentComment IS NOT NULL AND TRIM(p_AssignmentComment) <> '' THEN
        INSERT INTO `TicketComment` (`TicketId`, `CommentBy`, `CommentText`, `CommentDate`)
        VALUES (p_TicketId, p_AssignedBy, CONCAT('Assignment: ', p_AssignmentComment), NOW());
END IF;

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_AssignedBy, v_OldStatus, 'Assigned', 'Ticket assigned');
END $$

DROP PROCEDURE IF EXISTS `StartTicketWork` $$
CREATE PROCEDURE `StartTicketWork`(
    IN p_TicketId INT,
    IN p_UserId INT
)
BEGIN
    DECLARE v_OldStatus VARCHAR(30);
    DECLARE v_AssignedTo INT;

SELECT `Status`, `AssignedTo` INTO v_OldStatus, v_AssignedTo
FROM `Tickets`
WHERE `TicketId` = p_TicketId;

IF v_OldStatus <> 'Assigned' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket must be Assigned before work can start';
END IF;

    IF v_AssignedTo <> p_UserId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only the assigned employee can start work';
END IF;

UPDATE `Tickets`
SET `Status` = 'In Progress',
    `StartedDate` = NOW()
WHERE `TicketId` = p_TicketId;

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_UserId, v_OldStatus, 'In Progress', 'Work started');
END $$

DROP PROCEDURE IF EXISTS `AddTicketComment` $$
CREATE PROCEDURE `AddTicketComment`(
    IN p_TicketId INT,
    IN p_UserId INT,
    IN p_CommentText LONGTEXT
)
BEGIN
INSERT INTO `TicketComment` (`TicketId`, `CommentBy`, `CommentText`, `CommentDate`)
VALUES (p_TicketId, p_UserId, p_CommentText, NOW());
END $$

DROP PROCEDURE IF EXISTS `ResolveTicket` $$
CREATE PROCEDURE `ResolveTicket`(
    IN p_TicketId INT,
    IN p_UserId INT,
    IN p_Solution LONGTEXT,
    IN p_ResolutionNotes LONGTEXT
)
BEGIN
    DECLARE v_OldStatus VARCHAR(30);
    DECLARE v_AssignedTo INT;

SELECT `Status`, `AssignedTo` INTO v_OldStatus, v_AssignedTo
FROM `Tickets`
WHERE `TicketId` = p_TicketId;

IF v_OldStatus NOT IN ('Assigned', 'In Progress') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ticket is not ready to be resolved';
END IF;

    IF v_AssignedTo <> p_UserId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only the assigned employee can resolve the ticket';
END IF;

INSERT INTO `TicketResolution` (
    `TicketId`, `ResolvedBy`, `Solution`, `ResolutionNotes`, `ResolvedDate`
) VALUES (
             p_TicketId, p_UserId, p_Solution, p_ResolutionNotes, NOW()
         )
    ON DUPLICATE KEY UPDATE
                         `ResolvedBy` = VALUES(`ResolvedBy`),
                         `Solution` = VALUES(`Solution`),
                         `ResolutionNotes` = VALUES(`ResolutionNotes`),
                         `ResolvedDate` = VALUES(`ResolvedDate`);

UPDATE `Tickets`
SET `Status` = 'Resolved',
    `ResolvedDate` = NOW(),
    `ClosedDate` = NULL
WHERE `TicketId` = p_TicketId;

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_UserId, v_OldStatus, 'Resolved', 'Solution submitted');
END $$

DROP PROCEDURE IF EXISTS `CloseTicket` $$
CREATE PROCEDURE `CloseTicket`(
    IN p_TicketId INT,
    IN p_UserId INT
)
BEGIN
    DECLARE v_OldStatus VARCHAR(30);
    DECLARE v_RaisedBy INT;

SELECT `Status`, `RaisedBy` INTO v_OldStatus, v_RaisedBy
FROM `Tickets`
WHERE `TicketId` = p_TicketId;

IF v_RaisedBy <> p_UserId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only the sender can close the ticket';
END IF;

    IF v_OldStatus <> 'Resolved' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only a Resolved ticket can be closed';
END IF;

UPDATE `Tickets`
SET `Status` = 'Closed',
    `ClosedDate` = NOW()
WHERE `TicketId` = p_TicketId;

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_UserId, v_OldStatus, 'Closed', 'Sender accepted the solution');
END $$

DROP PROCEDURE IF EXISTS `ReopenTicket` $$
CREATE PROCEDURE `ReopenTicket`(
    IN p_TicketId INT,
    IN p_UserId INT,
    IN p_Reason LONGTEXT
)
BEGIN
    DECLARE v_OldStatus VARCHAR(30);
    DECLARE v_RaisedBy INT;

SELECT `Status`, `RaisedBy` INTO v_OldStatus, v_RaisedBy
FROM `Tickets`
WHERE `TicketId` = p_TicketId;

IF v_RaisedBy <> p_UserId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only the sender can reopen the ticket';
END IF;

    IF v_OldStatus <> 'Resolved' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only a Resolved ticket can be reopened';
END IF;

UPDATE `Tickets`
SET `Status` = 'Reopened',
    `AssignedTo` = NULL,
    `AssignedBy` = NULL,
    `AssignedDate` = NULL,
    `StartedDate` = NULL,
    `ResolvedDate` = NULL,
    `ClosedDate` = NULL
WHERE `TicketId` = p_TicketId;

INSERT INTO `TicketComment` (`TicketId`, `CommentBy`, `CommentText`, `CommentDate`)
VALUES (p_TicketId, p_UserId, CONCAT('Reopened: ', p_Reason), NOW());

INSERT INTO `TicketHistory` (`TicketId`, `ChangedBy`, `OldStatus`, `NewStatus`, `Note`)
VALUES (p_TicketId, p_UserId, v_OldStatus, 'Reopened', 'Sender rejected the solution');
END $$

DROP PROCEDURE IF EXISTS `AddTicketAttachment` $$
CREATE PROCEDURE `AddTicketAttachment`(
    IN p_TicketId INT,
    IN p_FileName VARCHAR(255),
    IN p_StoredName VARCHAR(255),
    IN p_FilePath VARCHAR(1000),
    IN p_ContentType VARCHAR(150),
    IN p_AttachmentType VARCHAR(30),
    IN p_UploadedBy INT,
    IN p_UploadedDate DATETIME
)
BEGIN
INSERT INTO `TicketAttachment` (
    `TicketId`, `FileName`, `StoredName`, `FilePath`, `ContentType`,
    `AttachmentType`, `UploadedBy`, `UploadedDate`
) VALUES (
             p_TicketId, p_FileName, p_StoredName, p_FilePath, p_ContentType,
             p_AttachmentType, p_UploadedBy, p_UploadedDate
         );
END $$

DELIMITER ;

-- Quick checks after running this file:
-- SHOW TABLES LIKE 'Ticket%';
-- CALL GetTicketAssignableEmployees();


USE Pulse360Db;

-- ============================================================
-- EVENT MODULE TABLES
-- Run this file once in MySQL Workbench before opening Events.
-- ============================================================

CREATE TABLE IF NOT EXISTS EventTypes (
                                          EventTypeId INT AUTO_INCREMENT PRIMARY KEY,
                                          EventTypeName VARCHAR(100) NOT NULL UNIQUE,
    Color VARCHAR(7) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE IF NOT EXISTS Events (
                                      EventId INT AUTO_INCREMENT PRIMARY KEY,
                                      Title VARCHAR(150) NOT NULL,
    EventDate DATE NOT NULL,
    EventTypeId INT NOT NULL,
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT FK_Events_EventTypes
    FOREIGN KEY (EventTypeId)
    REFERENCES EventTypes(EventTypeId)
                                                  ON UPDATE CASCADE
                                                  ON DELETE RESTRICT
    );

-- ============================================================
-- EVENT TYPE PROCEDURES
-- ============================================================

DROP PROCEDURE IF EXISTS AddEventType;
DELIMITER //
CREATE PROCEDURE AddEventType(
    IN p_eventTypeName VARCHAR(100),
    IN p_color VARCHAR(7)
)
BEGIN
INSERT INTO EventTypes(EventTypeName, Color)
VALUES (TRIM(p_eventTypeName), p_color);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS GetAllEventTypes;
DELIMITER //
CREATE PROCEDURE GetAllEventTypes()
BEGIN
SELECT EventTypeId, EventTypeName, Color
FROM EventTypes
ORDER BY EventTypeName;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteEventType;
DELIMITER //
CREATE PROCEDURE DeleteEventType(
    IN p_eventTypeId INT,
    OUT p_deleted INT
)
BEGIN
DELETE FROM EventTypes
WHERE EventTypeId = p_eventTypeId
  AND NOT EXISTS (
    SELECT 1
    FROM Events
    WHERE Events.EventTypeId = p_eventTypeId
);
SET p_deleted = ROW_COUNT();
END //
DELIMITER ;

-- ============================================================
-- EVENT PROCEDURES
-- ============================================================

DROP PROCEDURE IF EXISTS AddEvent;
DELIMITER //
CREATE PROCEDURE AddEvent(
    IN p_title VARCHAR(150),
    IN p_eventDate DATE,
    IN p_eventTypeId INT
)
BEGIN
INSERT INTO Events(Title, EventDate, EventTypeId, IsActive)
VALUES (TRIM(p_title), p_eventDate, p_eventTypeId, TRUE);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS GetAllEvents;
DELIMITER //
CREATE PROCEDURE GetAllEvents()
BEGIN
SELECT
    e.EventId,
    e.Title,
    e.EventDate,
    e.EventTypeId,
    e.IsActive,
    et.EventTypeName,
    et.Color
FROM Events e
         INNER JOIN EventTypes et
                    ON e.EventTypeId = et.EventTypeId
ORDER BY e.EventDate DESC, e.EventId DESC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS GetActiveEvents;
DELIMITER //
CREATE PROCEDURE GetActiveEvents()
BEGIN
SELECT
    e.EventId,
    e.Title,
    e.EventDate,
    e.EventTypeId,
    e.IsActive,
    et.EventTypeName,
    et.Color
FROM Events e
         INNER JOIN EventTypes et
                    ON e.EventTypeId = et.EventTypeId
WHERE e.IsActive = TRUE
ORDER BY e.EventDate, e.EventId;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS GetEventById;
DELIMITER //
CREATE PROCEDURE GetEventById(
    IN p_eventId INT
)
BEGIN
SELECT
    e.EventId,
    e.Title,
    e.EventDate,
    e.EventTypeId,
    e.IsActive,
    et.EventTypeName,
    et.Color
FROM Events e
         INNER JOIN EventTypes et
                    ON e.EventTypeId = et.EventTypeId
WHERE e.EventId = p_eventId;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS UpdateEvent;
DELIMITER //
CREATE PROCEDURE UpdateEvent(
    IN p_eventId INT,
    IN p_title VARCHAR(150),
    IN p_eventDate DATE,
    IN p_eventTypeId INT,
    IN p_isActive BOOLEAN
)
BEGIN
UPDATE Events
SET
    Title = TRIM(p_title),
    EventDate = p_eventDate,
    EventTypeId = p_eventTypeId,
    IsActive = p_isActive
WHERE EventId = p_eventId;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteEvent;
DELIMITER //
CREATE PROCEDURE DeleteEvent(
    IN p_eventId INT
)
BEGIN
DELETE FROM Events
WHERE EventId = p_eventId;
END //
DELIMITER ;

-- Optional starter master types. Uncomment if you want defaults.
-- INSERT IGNORE INTO EventTypes(EventTypeName, Color) VALUES
-- ('Holiday', '#563d7c'),
-- ('Birthday', '#30d96b');

USE Pulse360Db;

DROP PROCEDURE IF EXISTS `GetTicketAssignableEmployees`;

DELIMITER $$

CREATE PROCEDURE `GetTicketAssignableEmployees`(
    IN p_ExcludedUserId INT
)
BEGIN
SELECT
    `UserId`,
    `FirstName`,
    `LastName`
FROM `User`
WHERE `RoleId` = 10
  AND `UserId` <> p_ExcludedUserId
  AND (`Status` IS NULL OR `Status` = 'Active')
ORDER BY `FirstName`, `LastName`;
END $$

DELIMITER ;
