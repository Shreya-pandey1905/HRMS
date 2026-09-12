package service.Projects;

import models.Employees.User;

import java.util.List;

public interface UserService
{

    List<User> getProjectManagers() throws Exception;

    List<User> getProjectEmployees() throws Exception;
    void addProjectEmployee(int projectId, int userId) throws Exception;
    void updateProjectEmployees(int projectId, String[] teamMembers) throws Exception;
    List<User> getProjectEmployeesByProject(
            int projectId
    ) throws Exception;
}
