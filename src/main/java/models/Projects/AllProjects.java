package models.Projects;

import java.time.LocalDateTime;
import java.util.List;

public class AllProjects {

    private int projectId;
    private String projectName;
    private String clientName;
    private String description;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String priority;
    private double projectValue;
    private String priceType;
    private String filePath;
    private String logoPath;
    private String status;
    private String managerName;

    // Used for displaying team member names in project list
    private String teamMembers;

    // Used for identifying selected team members while editing
    private List<Integer> teamMemberIds;


    // Default Constructor
    public AllProjects() {
    }


    // Parameterized Constructor
    public AllProjects(int projectId,
                       String projectName,
                       String clientName,
                       String description,
                       LocalDateTime startDate,
                       LocalDateTime endDate,
                       String priority,
                       double projectValue,
                       String priceType,
                       String filePath,
                       String logoPath,
                       String status,
                       String managerName,
                       String teamMembers) {

        this.projectId = projectId;
        this.projectName = projectName;
        this.clientName = clientName;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.priority = priority;
        this.projectValue = projectValue;
        this.priceType = priceType;
        this.filePath = filePath;
        this.logoPath = logoPath;
        this.status = status;
        this.managerName = managerName;
        this.teamMembers = teamMembers;
    }


    // Getters and Setters

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }


    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }


    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }


    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }


    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }


    public double getProjectValue() {
        return projectValue;
    }

    public void setProjectValue(double projectValue) {
        this.projectValue = projectValue;
    }


    public String getPriceType() {
        return priceType;
    }

    public void setPriceType(String priceType) {
        this.priceType = priceType;
    }


    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }


    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }


    // Team member names
    public String getTeamMembers() {
        return teamMembers;
    }

    public void setTeamMembers(String teamMembers) {
        this.teamMembers = teamMembers;
    }


    // Team member IDs
    public List<Integer> getTeamMemberIds() {
        return teamMemberIds;
    }

    public void setTeamMemberIds(List<Integer> teamMemberIds) {
        this.teamMemberIds = teamMemberIds;
    }


    @Override
    public String toString() {
        return "AllProjects{" +
                "projectId=" + projectId +
                ", projectName='" + projectName + '\'' +
                ", clientName='" + clientName + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", priority='" + priority + '\'' +
                ", projectValue=" + projectValue +
                ", priceType='" + priceType + '\'' +
                ", filePath='" + filePath + '\'' +
                ", logoPath='" + logoPath + '\'' +
                ", status='" + status + '\'' +
                ", managerName='" + managerName + '\'' +
                ", teamMembers='" + teamMembers + '\'' +
                ", teamMemberIds=" + teamMemberIds +
                '}';
    }
}