package models.Projects;

import java.time.LocalDateTime;

public class Task {

    private int taskId;
    private int projectId;
    private String title;
    private String description;
    private String status;
    private String priority;
    private String filePath;
    private LocalDateTime deadline;

    // Employee assigned to task
    private int userId;
    private String employeeName;

    // Default Constructor
    public Task() {
    }

    // Parameterized Constructor
    public Task(int taskId, int projectId, String title,
                String description, String status,
                String priority, String filePath,
                LocalDateTime deadline) {

        this.taskId = taskId;
        this.projectId = projectId;
        this.title = title;
        this.description = description;
        this.status = status;
        this.priority = priority;
        this.filePath = filePath;
        this.deadline = deadline;
    }

    // Getters and Setters

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public LocalDateTime getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }

    // Employee User ID
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Employee Name
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId=" + taskId +
                ", projectId=" + projectId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", priority='" + priority + '\'' +
                ", filePath='" + filePath + '\'' +
                ", deadline=" + deadline +
                ", userId=" + userId +
                ", employeeName='" + employeeName + '\'' +
                '}';
    }
}