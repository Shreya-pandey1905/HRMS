package dao.Projects;

import models.Projects.AllProjects;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao {

    public int addProject(AllProjects project) throws Exception {

        String sql = "{CALL sp_add_project(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, project.getProjectName());
            cs.setString(2, project.getClientName());
            cs.setString(3, project.getDescription());

            cs.setObject(4, project.getStartDate());
            cs.setObject(5, project.getEndDate());

            cs.setString(6, project.getPriority());
            cs.setDouble(7, project.getProjectValue());
            cs.setString(8, project.getPriceType());
            cs.setString(9, project.getFilePath());
            cs.setString(10, project.getLogoPath());
            cs.setString(11, project.getStatus());
            cs.setString(12, project.getManagerName());

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {

                    int projectId = rs.getInt("ProjectId");

                    System.out.println(
                            "Project inserted successfully. ProjectId = "
                                    + projectId
                    );

                    return projectId;
                }
            }
        }

        throw new Exception("Project was not inserted");
    }

    public List<AllProjects> getAllProjects(
            int page,
            int pageSize,
            String sort) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_all_projects(?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, page);
            cs.setInt(2, pageSize);
            cs.setString(3, sort);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    Timestamp endDate =
                            rs.getTimestamp("EndDate");

                    if (endDate != null) {
                        project.setEndDate(
                                endDate.toLocalDateTime()
                        );
                    }

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setTeamMembers(
                            rs.getString("TeamMembers")
                    );

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public int getProjectCount() throws Exception {

        String sql = "{CALL sp_get_project_count()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("TotalProjects");
            }
        }

        return 0;
    }

    public boolean projectNameExists(String projectName) throws Exception {

        String sql = "{CALL sp_project_name_exists(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, projectName);

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt("ProjectCount") > 0;
                }
            }
        }

        return false;
    }

    public void deleteProject(int projectId) throws Exception {

        String sql = "{CALL sp_delete_project(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, projectId);

            cs.executeUpdate();
        }
    }

    public AllProjects getProjectById(int projectId) throws Exception {

        String sql = "{CALL sp_get_project_by_id(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, projectId);

            AllProjects project = null;

            // First result set = project details
            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {

                    project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setDescription(
                            rs.getString("Description")
                    );

                    project.setStartDate(
                            rs.getTimestamp("StartDate")
                                    .toLocalDateTime()
                    );

                    project.setEndDate(
                            rs.getTimestamp("EndDate")
                                    .toLocalDateTime()
                    );

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setProjectValue(
                            rs.getDouble("ProjectValue")
                    );

                    project.setPriceType(
                            rs.getString("PriceType")
                    );

                    project.setFilePath(
                            rs.getString("FilePath")
                    );

                    project.setLogoPath(
                            rs.getString("LogoPath")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );
                }

                // Second result set = assigned team member IDs
                if (cs.getMoreResults()) {

                    List<Integer> teamMemberIds = new ArrayList<>();

                    try (ResultSet teamRs = cs.getResultSet()) {

                        while (teamRs.next()) {

                            teamMemberIds.add(
                                    teamRs.getInt("UserId")
                            );
                        }
                    }

                    if (project != null) {
                        project.setTeamMemberIds(teamMemberIds);
                    }
                }
            }

            return project;
        }
    }

    public void updateProject(AllProjects project) throws Exception {

        String sql = "{CALL sp_update_project(?,?,?,?,?,?,?,?,?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, project.getProjectId());
            cs.setString(2, project.getProjectName());
            cs.setString(3, project.getClientName());
            cs.setString(4, project.getDescription());

            cs.setTimestamp(
                    5,
                    Timestamp.valueOf(project.getStartDate())
            );

            cs.setTimestamp(
                    6,
                    Timestamp.valueOf(project.getEndDate())
            );

            cs.setString(7, project.getPriority());
            cs.setDouble(8, project.getProjectValue());
            cs.setString(9, project.getPriceType());
            cs.setString(10, project.getStatus());
            cs.setString(11, project.getManagerName());

            cs.executeUpdate();
        }
    }

    public boolean projectNameExistsForEdit(
            String projectName,
            int projectId) throws Exception {

        String sql = "{CALL sp_project_name_exists_for_edit(?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, projectName);
            cs.setInt(2, projectId);

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt("ProjectCount") > 0;
                }
            }
        }

        return false;
    }

    public List<AllProjects> getAllProjectsForExport(
            String sort) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_all_projects_for_export(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, sort);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setDescription(
                            rs.getString("Description")
                    );

                    if (rs.getTimestamp("StartDate") != null) {
                        project.setStartDate(
                                rs.getTimestamp("StartDate")
                                        .toLocalDateTime()
                        );
                    }

                    if (rs.getTimestamp("EndDate") != null) {
                        project.setEndDate(
                                rs.getTimestamp("EndDate")
                                        .toLocalDateTime()
                        );
                    }

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setProjectValue(
                            rs.getDouble("ProjectValue")
                    );

                    project.setPriceType(
                            rs.getString("PriceType")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    project.setTeamMembers(
                            rs.getString("TeamMembers")
                    );

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public List<AllProjects> getTaskProjectsByPriority(
            String priority) throws Exception {

        List<AllProjects> projects =
                new ArrayList<>();

        String sql =
                "{CALL sp_get_task_projects(?)}";

        try (
                Connection connection =
                        DBConfig.getConnection();

                CallableStatement cs =
                        connection.prepareCall(sql)
        ) {

            cs.setString(1, priority);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project =
                            new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setProjectValue(
                            rs.getDouble("ProjectValue")
                    );

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    Timestamp startDate =
                            rs.getTimestamp("StartDate");

                    if (startDate != null) {
                        project.setStartDate(
                                startDate.toLocalDateTime()
                        );
                    }

                    Timestamp endDate =
                            rs.getTimestamp("EndDate");

                    if (endDate != null) {
                        project.setEndDate(
                                endDate.toLocalDateTime()
                        );
                    }

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public List<AllProjects> getActiveProjects() throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_active_projects()}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                AllProjects project = new AllProjects();

                project.setProjectId(
                        rs.getInt("ProjectId")
                );

                project.setProjectName(
                        rs.getString("ProjectName")
                );

                projects.add(project);
            }
        }

        return projects;
    }

    public List<AllProjects> getProjectsByManager(
            int managerId,
            int page,
            int pageSize,
            String sort
    ) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_projects_by_manager(?, ?, ?, ?)}";

        try (Connection con = DBConfig.getConnection();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, managerId);
            cs.setInt(2, page);
            cs.setInt(3, pageSize);
            cs.setString(4, sort);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(rs.getInt("ProjectId"));
                    project.setProjectName(rs.getString("ProjectName"));
                    project.setManagerName(rs.getString("ManagerName"));

                    if (rs.getTimestamp("EndDate") != null) {
                        project.setEndDate(
                                rs.getTimestamp("EndDate").toLocalDateTime()
                        );
                    }

                    project.setPriority(rs.getString("Priority"));
                    project.setStatus(rs.getString("Status"));
                    project.setTeamMembers(rs.getString("TeamMembers"));

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public int getProjectCountByManager(int managerId) throws Exception {

        String sql = "{CALL sp_get_project_count_by_manager(?)}";

        try (Connection con = DBConfig.getConnection();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, managerId);

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt("TotalProjects");
                }
            }
        }

        return 0;
    }

    public List<AllProjects> getProjectsByManagerForExport(
            int managerId,
            String sort
    ) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_projects_by_manager_for_export(?, ?)}";

        try (Connection con = DBConfig.getConnection();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, managerId);
            cs.setString(2, sort);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(rs.getInt("ProjectId"));
                    project.setProjectName(rs.getString("ProjectName"));
                    project.setClientName(rs.getString("ClientName"));
                    project.setDescription(rs.getString("Description"));

                    if (rs.getTimestamp("StartDate") != null) {
                        project.setStartDate(
                                rs.getTimestamp("StartDate").toLocalDateTime()
                        );
                    }

                    if (rs.getTimestamp("EndDate") != null) {
                        project.setEndDate(
                                rs.getTimestamp("EndDate").toLocalDateTime()
                        );
                    }

                    project.setPriority(rs.getString("Priority"));
                    project.setProjectValue(rs.getDouble("ProjectValue"));
                    project.setPriceType(rs.getString("PriceType"));
                    project.setStatus(rs.getString("Status"));
                    project.setManagerName(rs.getString("ManagerName"));
                    project.setTeamMembers(rs.getString("TeamMembers"));

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public List<AllProjects> getTaskProjectsByManager(
            int managerId,
            String priority
    ) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_task_projects_by_manager(?, ?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, managerId);
            cs.setString(2, priority);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setProjectValue(
                            rs.getDouble("ProjectValue")
                    );

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    Timestamp startDate =
                            rs.getTimestamp("StartDate");

                    if (startDate != null) {
                        project.setStartDate(
                                startDate.toLocalDateTime()
                        );
                    }

                    Timestamp endDate =
                            rs.getTimestamp("EndDate");

                    if (endDate != null) {
                        project.setEndDate(
                                endDate.toLocalDateTime()
                        );
                    }

                    projects.add(project);
                }
            }
        }

        return projects;
    }

    public List<AllProjects> getActiveProjectsByManager(
            int managerId
    ) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_active_projects_by_manager(?)}";

        try (
                Connection connection = DBConfig.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, managerId);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    AllProjects project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setProjectValue(
                            rs.getDouble("ProjectValue")
                    );

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    Timestamp startDate =
                            rs.getTimestamp("StartDate");

                    if (startDate != null) {
                        project.setStartDate(
                                startDate.toLocalDateTime()
                        );
                    }

                    Timestamp endDate =
                            rs.getTimestamp("EndDate");

                    if (endDate != null) {
                        project.setEndDate(
                                endDate.toLocalDateTime()
                        );
                    }

                    projects.add(project);
                }
            }
        }

        return projects;
    }

}