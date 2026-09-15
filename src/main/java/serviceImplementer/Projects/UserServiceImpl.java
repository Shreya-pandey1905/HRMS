package serviceImplementer.Projects;

import dao.Projects.UserDao;
import models.Employees.User;
import service.Projects.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    private final UserDao userDao = new UserDao();

    @Override
    public List<User> getProjectManagers() throws Exception {
        return userDao.getProjectManagers();
    }

    @Override
    public List<User> getProjectEmployees() throws Exception {
        return userDao.getProjectEmployees();
    }

    @Override
    public void addProjectEmployee(int projectId, int userId) throws Exception {

        userDao.addProjectEmployee(projectId, userId);
    }

    @Override
    public void updateProjectEmployees(
            int projectId,
            String[] teamMembers) throws Exception {

        userDao.deleteProjectEmployees(projectId);

        if (teamMembers != null) {
            for (String teamMember : teamMembers) {
                int userId = Integer.parseInt(teamMember);

                userDao.addProjectEmployee(
                        projectId,
                        userId
                );
            }
        }
    }

    @Override
    public List<User> getProjectEmployeesByProject(
            int projectId) throws Exception {

        return userDao.getProjectEmployeesByProject(projectId);
    }

}