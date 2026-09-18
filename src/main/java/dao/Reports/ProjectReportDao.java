package dao.Reports;

import models.Reports.ProjectReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ProjectReportDao {

    public List<ProjectReport> getAll() {

        List<ProjectReport> projectList = new ArrayList<>();

        String sql = "{CALL GetProjectReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                ProjectReport project = new ProjectReport();

                project.setProjectId(resultSet.getInt("ProjectId"));
                project.setProjectName(resultSet.getString("ProjectName"));
                project.setClientName(resultSet.getString("ClientName"));
                project.setManagerName(resultSet.getString("ManagerName"));

                Timestamp startDate = resultSet.getTimestamp("StartDate");
                if (startDate != null) {
                    project.setStartDate(startDate.toLocalDateTime());
                }

                Timestamp endDate = resultSet.getTimestamp("EndDate");
                if (endDate != null) {
                    project.setEndDate(endDate.toLocalDateTime());
                }

                project.setPriority(resultSet.getString("Priority"));
                project.setStatus(resultSet.getString("Status"));
                project.setMembers(resultSet.getString("Members"));

                projectList.add(project);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch project report",
                    e
            );
        }

        return projectList;
    }
}
