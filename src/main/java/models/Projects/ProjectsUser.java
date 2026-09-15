
package models.Projects;

public class ProjectsUser {

    private int projectsProjectId;
    private int usersUserId;

    // Default Constructor
    public ProjectsUser() {
    }

    // Parameterized Constructor
    public ProjectsUser(int projectsProjectId, int usersUserId) {
        this.projectsProjectId = projectsProjectId;
        this.usersUserId = usersUserId;
    }

    // Getters and Setters

    public int getProjectsProjectId() {
        return projectsProjectId;
    }

    public void setProjectsProjectId(int projectsProjectId) {
        this.projectsProjectId = projectsProjectId;
    }

    public int getUsersUserId() {
        return usersUserId;
    }

    public void setUsersUserId(int usersUserId) {
        this.usersUserId = usersUserId;
    }

    @Override
    public String toString() {
        return "ProjectsUser{" +
                "projectsProjectId=" + projectsProjectId +
                ", usersUserId=" + usersUserId +
                '}';
    }
}
