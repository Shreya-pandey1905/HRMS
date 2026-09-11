package service.Projects;

import models.Projects.AllProjects;

import java.util.List;

public interface ProjectService {

    int addProject(AllProjects project) throws Exception;

    List<AllProjects> getAllProjects(
            int page,
            int pageSize,
            String sort
    ) throws Exception;

    int getProjectCount() throws Exception;
    boolean projectNameExists(String projectName) throws Exception;
    void deleteProject(int projectId) throws Exception;
    AllProjects getProjectById(int projectId) throws Exception;

    void updateProject(AllProjects project) throws Exception;

    boolean projectNameExistsForEdit(
            String projectName,
            int projectId
    ) throws Exception;
    List<AllProjects> getAllProjectsForExport(
            String sort
    ) throws Exception;

    List<AllProjects> getTaskProjectsByPriority(
            String priority
    ) throws Exception;

    List<AllProjects> getActiveProjects() throws Exception;

}