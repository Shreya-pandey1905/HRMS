package serviceImplementer.Projects;

import dao.Projects.ProjectDao;
import models.Projects.AllProjects;
import service.Projects.ProjectService;

import java.util.List;

public class ProjectServiceImpl implements ProjectService {

    private final ProjectDao projectDao = new ProjectDao();

    @Override
    public int addProject(AllProjects project) throws Exception {

        if (project == null) {
            throw new Exception("Project data cannot be null");
        }

        if (project.getProjectName() == null ||
                project.getProjectName().trim().isEmpty()) {

            throw new Exception("Project name is required");
        }

        if (projectDao.projectNameExists(project.getProjectName().trim())) {
            throw new Exception("Project name already exists");
        }

        if (project.getClientName() == null ||
                project.getClientName().trim().isEmpty()) {

            throw new Exception("Client name is required");
        }

        if (project.getDescription() == null ||
                project.getDescription().trim().isEmpty()) {

            throw new Exception("Project description is required");
        }

        if (project.getStartDate() == null) {
            throw new Exception("Start date is required");
        }

        if (project.getEndDate() == null) {
            throw new Exception("End date is required");
        }

        if (project.getEndDate().isBefore(project.getStartDate())) {
            throw new Exception(
                    "End date cannot be before start date"
            );
        }

        if (project.getPriority() == null ||
                project.getPriority().trim().isEmpty()) {

            throw new Exception("Priority is required");
        }

        if (project.getPriceType() == null ||
                project.getPriceType().trim().isEmpty()) {

            throw new Exception("Price type is required");
        }

        if (project.getStatus() == null ||
                project.getStatus().trim().isEmpty()) {

            throw new Exception("Status is required");
        }

        if (project.getManagerName() == null ||
                project.getManagerName().trim().isEmpty()) {

            throw new Exception("Manager name is required");
        }

        return projectDao.addProject(project);
    }

    @Override
    public List<AllProjects> getAllProjects(
            int page,
            int pageSize,
            String sort) throws Exception {

        return projectDao.getAllProjects(
                page,
                pageSize,
                sort
        );
    }

    @Override
    public int getProjectCount() throws Exception {
        return projectDao.getProjectCount();
    }

    @Override
    public boolean projectNameExists(String projectName) throws Exception {
        return projectDao.projectNameExists(projectName);
    }

    @Override
    public void deleteProject(int projectId) throws Exception {
        projectDao.deleteProject(projectId);
    }

    @Override
    public AllProjects getProjectById(int projectId)
            throws Exception {

        return projectDao.getProjectById(projectId);
    }

    @Override
    public void updateProject(AllProjects project)
            throws Exception {

        projectDao.updateProject(project);
    }

    @Override
    public boolean projectNameExistsForEdit(
            String projectName,
            int projectId)
            throws Exception {

        return projectDao.projectNameExistsForEdit(
                projectName,
                projectId
        );
    }

    @Override
    public List<AllProjects> getAllProjectsForExport(
            String sort) throws Exception {

        return projectDao.getAllProjectsForExport(sort);
    }

    @Override
    public List<AllProjects> getTaskProjectsByPriority(
            String priority
    ) throws Exception {

        return projectDao.getTaskProjectsByPriority(priority);
    }

    @Override
    public List<AllProjects> getActiveProjects() throws Exception {
        return projectDao.getActiveProjects();
    }

}