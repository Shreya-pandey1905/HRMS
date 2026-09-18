package dao.Projects;

import models.Projects.Task;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {

    public List<Task> getTasksByPriority(String priority) throws Exception {

        List<Task> tasks = new ArrayList<>();

        String sql = "{CALL sp_get_tasks(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setString(1, priority);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    Task task = new Task();

                    task.setTaskId(rs.getInt("TaskId"));
                    task.setProjectId(rs.getInt("ProjectId"));
                    task.setTitle(rs.getString("Title"));
                    task.setDescription(rs.getString("Description"));
                    task.setStatus(rs.getString("Status"));
                    task.setPriority(rs.getString("Priority"));
                    task.setFilePath(rs.getString("FilePath"));

                    Timestamp deadline = rs.getTimestamp("Deadline");

                    if (deadline != null) {
                        task.setDeadline(deadline.toLocalDateTime());
                    }

                    // Employee information
                    task.setUserId(rs.getInt("UserId"));

                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");

                    String employeeName = "";

                    if (firstName != null) {
                        employeeName = firstName;
                    }

                    if (lastName != null && !lastName.trim().isEmpty()) {
                        employeeName += " " + lastName;
                    }

                    task.setEmployeeName(employeeName.trim());

                    tasks.add(task);
                }
            }
        }

        return tasks;
    }

    public void  addTask(Task task, int userId) throws Exception {

        String sql = "{CALL sp_add_task(?,?,?,?,?,?,?,?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, task.getProjectId());
            cs.setString(2, task.getTitle());
            cs.setString(3, task.getDescription());
            cs.setString(4, task.getStatus());
            cs.setString(5, task.getPriority());
            cs.setString(6, task.getFilePath());

            cs.setTimestamp(
                    7,
                    Timestamp.valueOf(task.getDeadline())
            );

            cs.setInt(8, userId);

            cs.execute();
        }
    }

    public List<Task> getTasksByManager(
            int managerId,
            String priority
    ) throws Exception {

        List<Task> tasks = new ArrayList<>();

        String sql = "{CALL sp_get_tasks_by_manager(?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, managerId);
            cs.setString(2, priority);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    Task task = new Task();

                    task.setTaskId(
                            rs.getInt("TaskId")
                    );

                    task.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    task.setTitle(
                            rs.getString("Title")
                    );

                    task.setDescription(
                            rs.getString("Description")
                    );

                    task.setStatus(
                            rs.getString("Status")
                    );

                    task.setPriority(
                            rs.getString("Priority")
                    );

                    task.setFilePath(
                            rs.getString("FilePath")
                    );

                    Timestamp deadline =
                            rs.getTimestamp("Deadline");

                    if (deadline != null) {
                        task.setDeadline(
                                deadline.toLocalDateTime()
                        );
                    }

                    // Employee information
                    task.setUserId(
                            rs.getInt("UserId")
                    );

                    String firstName =
                            rs.getString("FirstName");

                    String lastName =
                            rs.getString("LastName");

                    String employeeName = "";

                    if (firstName != null) {
                        employeeName = firstName;
                    }

                    if (lastName != null &&
                            !lastName.trim().isEmpty()) {

                        employeeName += " " + lastName;
                    }

                    task.setEmployeeName(
                            employeeName.trim()
                    );

                    tasks.add(task);
                }
            }
        }

        return tasks;
    }
}