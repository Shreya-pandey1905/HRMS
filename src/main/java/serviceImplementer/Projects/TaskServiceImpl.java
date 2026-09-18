package serviceImplementer.Projects;

import dao.Projects.TaskDao;
import models.Projects.Task;
import service.Projects.TaskService;

import java.util.List;

public class TaskServiceImpl implements TaskService {

    private final TaskDao taskDao = new TaskDao();

    @Override
    public List<Task> getTasksByPriority(String priority)
            throws Exception {

        return taskDao.getTasksByPriority(priority);
    }

    @Override
    public void addTask(Task task, int userId) throws Exception {
        taskDao.addTask(task, userId);
    }

    @Override
    public List<Task> getTasksByManager(
            int managerId,
            String priority
    ) throws Exception {

        return taskDao.getTasksByManager(
                managerId,
                priority
        );
    }
}