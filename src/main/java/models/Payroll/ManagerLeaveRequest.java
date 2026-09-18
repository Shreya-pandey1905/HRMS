package models.Payroll;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ManagerLeaveRequest {
    private Integer leaveRequestId;
    private Integer userId;
    private String employeeName;
    private String employeeEmail;
    private Integer leaveTypeId;
    private String leaveType;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private Integer numberOfDays;
    private String reason;
    private String approvedBy;
    private String status;
    private String statusHistory;

    public Integer getLeaveRequestId() { return leaveRequestId; }
    public void setLeaveRequestId(Integer leaveRequestId) { this.leaveRequestId = leaveRequestId; }
    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }
    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
    public String getEmployeeEmail() { return employeeEmail; }
    public void setEmployeeEmail(String employeeEmail) { this.employeeEmail = employeeEmail; }
    public Integer getLeaveTypeId() { return leaveTypeId; }
    public void setLeaveTypeId(Integer leaveTypeId) { this.leaveTypeId = leaveTypeId; }
    public String getLeaveType() { return leaveType; }
    public void setLeaveType(String leaveType) { this.leaveType = leaveType; }
    public LocalDateTime getStartDate() { return startDate; }
    public void setStartDate(LocalDateTime startDate) { this.startDate = startDate; }
    public LocalDateTime getEndDate() { return endDate; }
    public void setEndDate(LocalDateTime endDate) { this.endDate = endDate; }
    public Integer getNumberOfDays() { return numberOfDays; }
    public void setNumberOfDays(Integer numberOfDays) { this.numberOfDays = numberOfDays; }
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    public String getApprovedBy() { return approvedBy; }
    public void setApprovedBy(String approvedBy) { this.approvedBy = approvedBy; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getStatusHistory() { return statusHistory; }
    public void setStatusHistory(String statusHistory) { this.statusHistory = statusHistory; }

    public String getStartDateLabel() {
        return startDate == null ? "-" : startDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getEndDateLabel() {
        return endDate == null ? "-" : endDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getStatusLabel() {
        if (status == null || status.trim().isEmpty()) return "Pending";
        if ("Declined".equalsIgnoreCase(status)) return "Rejected";
        return status;
    }

    public String getStatusBadgeClass() {
        String value = getStatusLabel();
        if ("Approved".equalsIgnoreCase(value)) return "badge-success";
        if ("Rejected".equalsIgnoreCase(value)) return "badge-danger";
        return "badge-warning";
    }

    public boolean isActionable() {
        return "New".equalsIgnoreCase(status) || "Pending".equalsIgnoreCase(status);
    }
}
