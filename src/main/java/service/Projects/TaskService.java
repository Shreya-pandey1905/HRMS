package service.Projects;

import models.Projects.Task;

import java.util.List;

public interface TaskService
{
    List<Task> getTasksByPriority(String priority) throws Exception;
    void addTask(Task task, int userId) throws Exception;
}
