package models.Projects;

import java.time.LocalDateTime;

public class TaskBoards {

    private int taskBoardId;
    private int projectId;
    private int taskId;
    private int percentage;
    private LocalDateTime dueDate;
    private Integer tasksTaskId;

    // Default Constructor
    public TaskBoards() {
    }

    // Parameterized Constructor
    public TaskBoards(int taskBoardId, int projectId, int taskId,
                      int percentage, LocalDateTime dueDate,
                      Integer tasksTaskId) {

        this.taskBoardId = taskBoardId;
        this.projectId = projectId;
        this.taskId = taskId;
        this.percentage = percentage;
        this.dueDate = dueDate;
        this.tasksTaskId = tasksTaskId;
    }

    // Getters and Setters

    public int getTaskBoardId() {
        return taskBoardId;
    }

    public void setTaskBoardId(int taskBoardId) {
        this.taskBoardId = taskBoardId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }

    public LocalDateTime getDueDate() {
        return dueDate;
    }

    public void setDueDate(LocalDateTime dueDate) {
        this.dueDate = dueDate;
    }

    public Integer getTasksTaskId() {
        return tasksTaskId;
    }

    public void setTasksTaskId(Integer tasksTaskId) {
        this.tasksTaskId = tasksTaskId;
    }

    @Override
    public String toString() {
        return "TaskBoards{" +
                "taskBoardId=" + taskBoardId +
                ", projectId=" + projectId +
                ", taskId=" + taskId +
                ", percentage=" + percentage +
                ", dueDate=" + dueDate +
                ", tasksTaskId=" + tasksTaskId +
                '}';
    }
}

