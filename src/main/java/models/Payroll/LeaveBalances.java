package models.Payroll;

public class LeaveBalances {

    private Integer leaveBalanceId;
    private Integer userId;
    private Integer departmentLeavesId;
    private Integer leaveTypeId;
    private Integer totalLeaves;
    private Integer usedLeaves;

    public Integer getLeaveBalanceId() {
        return leaveBalanceId;
    }

    public void setLeaveBalanceId(Integer leaveBalanceId) {
        this.leaveBalanceId = leaveBalanceId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDepartmentLeavesId() {
        return departmentLeavesId;
    }

    public void setDepartmentLeavesId(Integer departmentLeavesId) {
        this.departmentLeavesId = departmentLeavesId;
    }

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public Integer getTotalLeaves() {
        return totalLeaves;
    }

    public void setTotalLeaves(Integer totalLeaves) {
        this.totalLeaves = totalLeaves;
    }

    public Integer getUsedLeaves() {
        return usedLeaves;
    }

    public void setUsedLeaves(Integer usedLeaves) {
        this.usedLeaves = usedLeaves;
    }

    @Override
    public String toString() {
        return "LeaveBalances{" +
                "leaveBalanceId=" + leaveBalanceId +
                ", userId=" + userId +
                ", departmentLeavesId=" + departmentLeavesId +
                ", leaveTypeId=" + leaveTypeId +
                ", totalLeaves=" + totalLeaves +
                ", usedLeaves=" + usedLeaves +
                '}';
    }
}
