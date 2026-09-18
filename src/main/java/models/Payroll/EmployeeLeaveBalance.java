package models.Payroll;

public class EmployeeLeaveBalance {
    private Integer leaveTypeId;
    private String leaveType;
    private Integer totalLeaves;
    private Integer usedLeaves;
    private Integer remainingLeaves;

    public Integer getLeaveTypeId() { return leaveTypeId; }
    public void setLeaveTypeId(Integer leaveTypeId) { this.leaveTypeId = leaveTypeId; }
    public String getLeaveType() { return leaveType; }
    public void setLeaveType(String leaveType) { this.leaveType = leaveType; }
    public Integer getTotalLeaves() { return totalLeaves; }
    public void setTotalLeaves(Integer totalLeaves) { this.totalLeaves = totalLeaves; }
    public Integer getUsedLeaves() { return usedLeaves; }
    public void setUsedLeaves(Integer usedLeaves) { this.usedLeaves = usedLeaves; }
    public Integer getRemainingLeaves() { return remainingLeaves; }
    public void setRemainingLeaves(Integer remainingLeaves) { this.remainingLeaves = remainingLeaves; }
}
