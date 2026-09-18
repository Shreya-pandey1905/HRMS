package dao.Reports;

import models.Reports.TaskReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TaskReportDao {

    public List<TaskReport> getAll() {

        List<TaskReport> taskList = new ArrayList<>();

        String sql = "{CALL GetTaskReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                TaskReport task = new TaskReport();

                task.setTaskId(resultSet.getInt("TaskId"));
                task.setTaskName(resultSet.getString("TaskName"));
                task.setProjectName(resultSet.getString("ProjectName"));

                Timestamp deadline = resultSet.getTimestamp("Deadline");
                if (deadline != null) {
                    task.setDeadline(deadline.toLocalDateTime());
                }

                task.setPriority(resultSet.getString("Priority"));
                task.setStatus(resultSet.getString("Status"));

                taskList.add(task);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch task report",
                    e
            );
        }

        return taskList;
    }
}
