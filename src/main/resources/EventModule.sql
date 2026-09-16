USE pulse360db;

-- =========================
-- EVENT TYPE PROCEDURES
-- =========================

DROP PROCEDURE IF EXISTS AddEventType;
DELIMITER $$

CREATE PROCEDURE AddEventType(
    IN p_name VARCHAR(50),
    IN p_color VARCHAR(20)
)
BEGIN
INSERT INTO eventtypes (Name, Color)
VALUES (TRIM(p_name), p_color);
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetAllEventTypes;
DELIMITER $$

CREATE PROCEDURE GetAllEventTypes()
BEGIN
SELECT
    Id,
    Name,
    Color
FROM eventtypes
ORDER BY Id DESC;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetEventTypeById;
DELIMITER $$

CREATE PROCEDURE GetEventTypeById(
    IN p_id INT
)
BEGIN
SELECT
    Id,
    Name,
    Color
FROM eventtypes
WHERE Id = p_id;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS DeleteEventType;
DELIMITER $$

CREATE PROCEDURE DeleteEventType(
    IN p_id INT
)
BEGIN
DELETE FROM eventtypes
WHERE Id = p_id;
END $$

DELIMITER ;


-- =========================
-- EVENT PROCEDURES
-- =========================

DROP PROCEDURE IF EXISTS AddEvent;
DELIMITER $$

CREATE PROCEDURE AddEvent(
    IN p_title LONGTEXT,
    IN p_date LONGTEXT,
    IN p_eventTypeId INT,
    IN p_status VARCHAR(50)
)
BEGIN
INSERT INTO events (
    Title,
    Date,
    EventTypeId,
    Status
)
VALUES (
           TRIM(p_title),
           p_date,
           p_eventTypeId,
           p_status
       );
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetAllEvents;
DELIMITER $$

CREATE PROCEDURE GetAllEvents()
BEGIN
SELECT
    e.Id,
    e.Title,
    e.Date,
    e.EventTypeId,
    e.Status,
    et.Name AS EventTypeName,
    et.Color
FROM events e
         LEFT JOIN eventtypes et
                   ON e.EventTypeId = et.Id
ORDER BY e.Id DESC;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetActiveEvents;
DELIMITER $$

CREATE PROCEDURE GetActiveEvents()
BEGIN
SELECT
    e.Id,
    e.Title,
    e.Date,
    e.EventTypeId,
    e.Status,
    et.Name AS EventTypeName,
    et.Color
FROM events e
         LEFT JOIN eventtypes et
                   ON e.EventTypeId = et.Id
WHERE e.Status = 'Active'
ORDER BY e.Id DESC;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS GetEventById;
DELIMITER $$

CREATE PROCEDURE GetEventById(
    IN p_id INT
)
BEGIN
SELECT
    e.Id,
    e.Title,
    e.Date,
    e.EventTypeId,
    e.Status,
    et.Name AS EventTypeName,
    et.Color
FROM events e
         LEFT JOIN eventtypes et
                   ON e.EventTypeId = et.Id
WHERE e.Id = p_id;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS UpdateEvent;
DELIMITER $$

CREATE PROCEDURE UpdateEvent(
    IN p_id INT,
    IN p_title LONGTEXT,
    IN p_date LONGTEXT,
    IN p_eventTypeId INT,
    IN p_status VARCHAR(50)
)
BEGIN
UPDATE events
SET
    Title = TRIM(p_title),
    Date = p_date,
    EventTypeId = p_eventTypeId,
    Status = p_status
WHERE Id = p_id;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS DeleteEvent;
DELIMITER $$

CREATE PROCEDURE DeleteEvent(
    IN p_id INT
)
BEGIN
DELETE FROM events
WHERE Id = p_id;
END $$

DELIMITER ;