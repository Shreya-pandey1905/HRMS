package models.Projects;

public class TaskMember {

    private int assignedId;
    private int taskId;
    private int userId;

    // Default Constructor
    public TaskMember() {
    }

    // Parameterized Constructor
    public TaskMember(int assignedId, int taskId, int userId) {
        this.assignedId = assignedId;
        this.taskId = taskId;
        this.userId = userId;
    }

    // Getters and Setters

    public int getAssignedId() {
        return assignedId;
    }

    public void setAssignedId(int assignedId) {
        this.assignedId = assignedId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "TaskMember{" +
                "assignedId=" + assignedId +
                ", taskId=" + taskId +
                ", userId=" + userId +
                '}';
    }
}

