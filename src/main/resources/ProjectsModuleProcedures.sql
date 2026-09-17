USE Pulse360Db;

DELIMITER $$


-- =========================================================
-- PROJECT PROCEDURES
-- =========================================================

DROP PROCEDURE IF EXISTS sp_add_project $$
CREATE PROCEDURE sp_add_project(
    IN p_project_name VARCHAR(255),
    IN p_client_name VARCHAR(255),
    IN p_description VARCHAR(1000),
    IN p_start_date DATETIME,
    IN p_end_date DATETIME,
    IN p_priority VARCHAR(50),
    IN p_project_value DOUBLE,
    IN p_price_type VARCHAR(50),
    IN p_file_path VARCHAR(255),
    IN p_logo_path VARCHAR(255),
    IN p_status VARCHAR(50),
    IN p_manager_name LONGTEXT
)
BEGIN
    INSERT INTO AllProjects
    (
        ProjectName,
        ClientName,
        Description,
        StartDate,
        EndDate,
        Priority,
        ProjectValue,
        PriceType,
        FilePath,
        LogoPath,
        Status,
        ManagerName
    )
    VALUES
    (
        p_project_name,
        p_client_name,
        p_description,
        p_start_date,
        p_end_date,
        p_priority,
        p_project_value,
        p_price_type,
        p_file_path,
        p_logo_path,
        p_status,
        p_manager_name
    );

    SELECT LAST_INSERT_ID() AS ProjectId;
END $$


DROP PROCEDURE IF EXISTS sp_get_project_managers $$
CREATE PROCEDURE sp_get_project_managers()
BEGIN
    SELECT
        UserId,
        FirstName,
        LastName,
        Email
    FROM `User`
    WHERE RoleId = 8
      AND (Status IS NULL OR Status = 'Active')
    ORDER BY FirstName, LastName;
END $$


DROP PROCEDURE IF EXISTS sp_get_project_employees $$
CREATE PROCEDURE sp_get_project_employees()
BEGIN
    SELECT
        UserId,
        FirstName,
        LastName,
        Email
    FROM `User`
    WHERE RoleId NOT IN (3, 8)
      AND (Status IS NULL OR Status = 'Active')
    ORDER BY FirstName, LastName;
END $$


DROP PROCEDURE IF EXISTS sp_add_project_employee $$
CREATE PROCEDURE sp_add_project_employee(
    IN p_project_id INT,
    IN p_user_id INT
)
BEGIN
    INSERT INTO ProjectsUser
    (
        ProjectsProjectId,
        UsersUserId
    )
    VALUES
    (
        p_project_id,
        p_user_id
    );
END $$


DROP PROCEDURE IF EXISTS sp_get_project_count $$
CREATE PROCEDURE sp_get_project_count()
BEGIN
    SELECT COUNT(*) AS TotalProjects
    FROM AllProjects;
END $$


DROP PROCEDURE IF EXISTS sp_project_name_exists $$
CREATE PROCEDURE sp_project_name_exists(
    IN p_project_name VARCHAR(255)
)
BEGIN
    SELECT COUNT(*) AS ProjectCount
    FROM AllProjects
    WHERE LOWER(TRIM(ProjectName)) = LOWER(TRIM(p_project_name));
END $$


DROP PROCEDURE IF EXISTS sp_delete_project $$
CREATE PROCEDURE sp_delete_project(
    IN p_project_id INT
)
BEGIN

    -- Delete task members belonging to tasks of this project
    DELETE FROM TaskMember
    WHERE TaskId IN (
        SELECT TaskId
        FROM Task
        WHERE ProjectId = p_project_id
    );

    -- Delete task boards belonging to tasks of this project
    DELETE FROM TaskBoards
    WHERE ProjectId = p_project_id;

    -- Delete tasks belonging to this project
    DELETE FROM Task
    WHERE ProjectId = p_project_id;

    -- Delete timesheets belonging to this project
    DELETE FROM Timesheets
    WHERE ProjectId = p_project_id;

    -- Delete project employees
    DELETE FROM ProjectsUser
    WHERE ProjectsProjectId = p_project_id;

    -- Finally delete the project
    DELETE FROM AllProjects
    WHERE ProjectId = p_project_id;

END $$


DROP PROCEDURE IF EXISTS sp_get_project_by_id $$
CREATE PROCEDURE sp_get_project_by_id(
    IN p_project_id INT
)
BEGIN

    -- Project details
    SELECT
        ProjectId,
        ProjectName,
        ClientName,
        Description,
        StartDate,
        EndDate,
        Priority,
        ProjectValue,
        PriceType,
        FilePath,
        LogoPath,
        Status,
        ManagerName
    FROM AllProjects
    WHERE ProjectId = p_project_id;

    -- Assigned team members
    SELECT
        UsersUserId AS UserId
    FROM ProjectsUser
    WHERE ProjectsProjectId = p_project_id;

END $$


DROP PROCEDURE IF EXISTS sp_project_name_exists_for_edit $$
CREATE PROCEDURE sp_project_name_exists_for_edit(
    IN p_project_name VARCHAR(255),
    IN p_project_id INT
)
BEGIN
    SELECT COUNT(*) AS ProjectCount
    FROM AllProjects
    WHERE LOWER(TRIM(ProjectName)) = LOWER(TRIM(p_project_name))
      AND ProjectId <> p_project_id;
END $$


DROP PROCEDURE IF EXISTS sp_update_project $$
CREATE PROCEDURE sp_update_project(
    IN p_project_id INT,
    IN p_project_name VARCHAR(255),
    IN p_client_name VARCHAR(255),
    IN p_description VARCHAR(1000),
    IN p_start_date DATETIME,
    IN p_end_date DATETIME,
    IN p_priority VARCHAR(50),
    IN p_project_value DOUBLE,
    IN p_price_type VARCHAR(50),
    IN p_status VARCHAR(50),
    IN p_manager_name LONGTEXT
)
BEGIN
    UPDATE AllProjects
    SET
        ProjectName = p_project_name,
        ClientName = p_client_name,
        Description = p_description,
        StartDate = p_start_date,
        EndDate = p_end_date,
        Priority = p_priority,
        ProjectValue = p_project_value,
        PriceType = p_price_type,
        Status = p_status,
        ManagerName = p_manager_name
    WHERE ProjectId = p_project_id;
END $$


DROP PROCEDURE IF EXISTS sp_delete_project_employees $$
CREATE PROCEDURE sp_delete_project_employees(
    IN p_project_id INT
)
BEGIN
    DELETE FROM ProjectsUser
    WHERE ProjectsProjectId = p_project_id;
END $$


DROP PROCEDURE IF EXISTS sp_get_all_projects $$
CREATE PROCEDURE sp_get_all_projects(
    IN p_page INT,
    IN p_page_size INT,
    IN p_sort VARCHAR(10)
)
BEGIN

    DECLARE v_offset INT;

    SET v_offset = (p_page - 1) * p_page_size;

    IF LOWER(p_sort) = 'asc' THEN

        SELECT
            p.ProjectId,
            p.ProjectName,
            p.ManagerName,
            p.EndDate,
            p.Priority,
            p.Status,

            GROUP_CONCAT(
                CONCAT(u.FirstName, ' ', u.LastName)
                ORDER BY u.FirstName
                SEPARATOR ', '
            ) AS TeamMembers

        FROM AllProjects p

        LEFT JOIN ProjectsUser pu
            ON p.ProjectId = pu.ProjectsProjectId

        LEFT JOIN `User` u
            ON pu.UsersUserId = u.UserId

        GROUP BY
            p.ProjectId,
            p.ProjectName,
            p.ManagerName,
            p.EndDate,
            p.Priority,
            p.Status

        ORDER BY p.ProjectId ASC

        LIMIT v_offset, p_page_size;

    ELSE

        SELECT
            p.ProjectId,
            p.ProjectName,
            p.ManagerName,
            p.EndDate,
            p.Priority,
            p.Status,

            GROUP_CONCAT(
                CONCAT(u.FirstName, ' ', u.LastName)
                ORDER BY u.FirstName
                SEPARATOR ', '
            ) AS TeamMembers

        FROM AllProjects p

        LEFT JOIN ProjectsUser pu
            ON p.ProjectId = pu.ProjectsProjectId

        LEFT JOIN `User` u
            ON pu.UsersUserId = u.UserId

        GROUP BY
            p.ProjectId,
            p.ProjectName,
            p.ManagerName,
            p.EndDate,
            p.Priority,
            p.Status

        ORDER BY p.ProjectId DESC

        LIMIT v_offset, p_page_size;

    END IF;

END $$


DROP PROCEDURE IF EXISTS sp_get_all_projects_for_export $$
CREATE PROCEDURE sp_get_all_projects_for_export(
    IN p_sort VARCHAR(10)
)
BEGIN

    IF LOWER(p_sort) = 'asc' THEN

        SELECT
            p.ProjectId,
            p.ProjectName,
            p.ClientName,
            p.Description,
            p.StartDate,
            p.EndDate,
            p.Priority,
            p.ProjectValue,
            p.PriceType,
            p.Status,
            p.ManagerName,

            GROUP_CONCAT(
                CONCAT(u.FirstName, ' ', u.LastName)
                ORDER BY u.FirstName
                SEPARATOR ', '
            ) AS TeamMembers

        FROM AllProjects p

        LEFT JOIN ProjectsUser pu
            ON p.ProjectId = pu.ProjectsProjectId

        LEFT JOIN `User` u
            ON pu.UsersUserId = u.UserId

        GROUP BY
            p.ProjectId,
            p.ProjectName,
            p.ClientName,
            p.Description,
            p.StartDate,
            p.EndDate,
            p.Priority,
            p.ProjectValue,
            p.PriceType,
            p.Status,
            p.ManagerName

        ORDER BY p.ProjectId ASC;

    ELSE

        SELECT
            p.ProjectId,
            p.ProjectName,
            p.ClientName,
            p.Description,
            p.StartDate,
            p.EndDate,
            p.Priority,
            p.ProjectValue,
            p.PriceType,
            p.Status,
            p.ManagerName,

            GROUP_CONCAT(
                CONCAT(u.FirstName, ' ', u.LastName)
                ORDER BY u.FirstName
                SEPARATOR ', '
            ) AS TeamMembers

        FROM AllProjects p

        LEFT JOIN ProjectsUser pu
            ON p.ProjectId = pu.ProjectsProjectId

        LEFT JOIN `User` u
            ON pu.UsersUserId = u.UserId

        GROUP BY
            p.ProjectId,
            p.ProjectName,
            p.ClientName,
            p.Description,
            p.StartDate,
            p.EndDate,
            p.Priority,
            p.ProjectValue,
            p.PriceType,
            p.Status,
            p.ManagerName

        ORDER BY p.ProjectId DESC;

    END IF;

END $$


DROP PROCEDURE IF EXISTS sp_get_project_employees_by_project $$
CREATE PROCEDURE sp_get_project_employees_by_project(
    IN p_project_id INT
)
BEGIN
    SELECT
        u.UserId,
        u.FirstName,
        u.LastName,
        u.Email
    FROM `User` u
    INNER JOIN ProjectsUser pu
        ON pu.UsersUserId = u.UserId
    WHERE pu.ProjectsProjectId = p_project_id
      AND (u.Status IS NULL OR u.Status = 'Active')
    ORDER BY u.FirstName, u.LastName;
END $$


DROP PROCEDURE IF EXISTS sp_get_active_projects $$
CREATE PROCEDURE sp_get_active_projects()
BEGIN
    SELECT
        ProjectId,
        ProjectName
    FROM AllProjects
    WHERE LOWER(Status) = 'active'
    ORDER BY ProjectName;
END $$


-- =========================================================
-- TASK PROCEDURES
-- =========================================================

DROP PROCEDURE IF EXISTS sp_add_task $$
CREATE PROCEDURE sp_add_task(
    IN p_project_id INT,
    IN p_title VARCHAR(255),
    IN p_description VARCHAR(1000),
    IN p_status VARCHAR(50),
    IN p_priority VARCHAR(50),
    IN p_file_path VARCHAR(255),
    IN p_deadline DATETIME,
    IN p_user_id INT
)
BEGIN

    DECLARE v_task_id INT;

    -- Due date cannot be before today
    IF DATE(p_deadline) < CURDATE() THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Due date cannot be before today';

    END IF;


    -- Employee can have only one task in the same project
    IF EXISTS (
        SELECT 1
        FROM TaskMember tm
        INNER JOIN Task t
            ON t.TaskId = tm.TaskId
        WHERE tm.UserId = p_user_id
          AND t.ProjectId = p_project_id
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'This employee already has an assigned task.';

    END IF;


    -- Insert task
    INSERT INTO Task
    (
        ProjectId,
        Title,
        Description,
        Status,
        Priority,
        FilePath,
        Deadline
    )
    VALUES
    (
        p_project_id,
        p_title,
        p_description,
        p_status,
        p_priority,
        p_file_path,
        p_deadline
    );


    -- Get generated TaskId
    SET v_task_id = LAST_INSERT_ID();


    -- Assign employee to task
    INSERT INTO TaskMember
    (
        TaskId,
        UserId
    )
    VALUES
    (
        v_task_id,
        p_user_id
    );

END $$


DROP PROCEDURE IF EXISTS sp_get_task_projects $$
CREATE PROCEDURE sp_get_task_projects(
    IN p_priority VARCHAR(50)
)
BEGIN

    SELECT
        p.ProjectId,
        p.ProjectName,
        p.ClientName,
        p.StartDate,
        p.EndDate,
        p.ProjectValue,
        p.PriceType,
        p.Priority,
        p.Status,
        p.ManagerName
    FROM AllProjects p
    WHERE
        p_priority = 'All'
        OR LOWER(p.Priority) = LOWER(p_priority)
    ORDER BY p.ProjectId DESC;

END $$


DROP PROCEDURE IF EXISTS sp_get_tasks $$
CREATE PROCEDURE sp_get_tasks(
    IN p_priority VARCHAR(50)
)
BEGIN

    SELECT
        t.TaskId,
        t.ProjectId,
        t.Title,
        t.Description,
        t.Status,
        t.Priority,
        t.FilePath,
        t.Deadline,

        u.UserId,
        u.FirstName,
        u.LastName

    FROM Task t

    LEFT JOIN TaskMember tm
        ON tm.TaskId = t.TaskId

    LEFT JOIN `User` u
        ON u.UserId = tm.UserId

    WHERE
        p_priority = 'All'
        OR LOWER(t.Priority) = LOWER(p_priority)

    ORDER BY
        t.ProjectId DESC,
        t.TaskId DESC;

END $$


DROP PROCEDURE IF EXISTS sp_get_task_page $$
CREATE PROCEDURE sp_get_task_page(
    IN p_priority VARCHAR(50)
)
BEGIN

    /*
     * RESULT SET 1
     * PROJECT INFORMATION
     */
    SELECT DISTINCT
        p.ProjectId,
        p.ProjectName,
        p.ClientName,
        p.StartDate,
        p.EndDate,
        p.ProjectValue,
        p.PriceType,
        p.Priority,
        p.Status,
        p.ManagerName

    FROM AllProjects p

    INNER JOIN Task t
        ON p.ProjectId = t.ProjectId

    WHERE
        p_priority = 'All'
        OR LOWER(t.Priority) = LOWER(p_priority)

    ORDER BY p.ProjectId DESC;


    /*
     * RESULT SET 2
     * TASK INFORMATION
     */
    SELECT
        t.TaskId,
        t.ProjectId,
        t.Title,
        t.Description,
        t.Status,
        t.Priority,
        t.FilePath,
        t.Deadline,

        tb.Percentage,
        tb.DueDate

    FROM Task t

    LEFT JOIN TaskBoards tb
        ON t.TaskId = tb.TaskId

    WHERE
        p_priority = 'All'
        OR LOWER(t.Priority) = LOWER(p_priority)

    ORDER BY
        t.ProjectId DESC,
        t.TaskId DESC;

END $$

DROP PROCEDURE IF EXISTS sp_get_projects_by_user_id $$

CREATE PROCEDURE sp_get_projects_by_user_id(
    IN p_user_id INT
)
BEGIN
    SELECT
        p.ProjectId,
        p.ProjectName,
        p.ClientName,
        p.Description,
        p.StartDate,
        p.EndDate,
        p.Priority,
        p.ProjectValue,
        p.PriceType,
        p.FilePath,
        p.LogoPath,
        p.Status,
        p.ManagerName
    FROM AllProjects p
    INNER JOIN ProjectsUser pu
        ON p.ProjectId = pu.ProjectsProjectId
    WHERE pu.UsersUserId = p_user_id
    ORDER BY p.ProjectId DESC;
END $$


DELIMITER ;
