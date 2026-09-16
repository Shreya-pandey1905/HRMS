package models.Payroll;

import java.time.LocalDateTime;

public class EmployeeLeaveRecord {
    private Integer leaveRequestId;
    private Integer userId;
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
        return startDate == null ? "-" : startDate.format(java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getEndDateLabel() {
        return endDate == null ? "-" : endDate.format(java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }
}
