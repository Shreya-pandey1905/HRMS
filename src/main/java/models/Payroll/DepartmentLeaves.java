package models.Payroll;

public class DepartmentLeaves {

    private Integer departmentLeavesId;
    private Integer departmentId;
    private Integer leaveTypeId;
    private Integer leavesCount;
    private String status;

    public Integer getDepartmentLeavesId() {
        return departmentLeavesId;
    }

    public void setDepartmentLeavesId(Integer departmentLeavesId) {
        this.departmentLeavesId = departmentLeavesId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public Integer getLeavesCount() {
        return leavesCount;
    }

    public void setLeavesCount(Integer leavesCount) {
        this.leavesCount = leavesCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DepartmentLeaves{" +
                "departmentLeavesId=" + departmentLeavesId +
                ", departmentId=" + departmentId +
                ", leaveTypeId=" + leaveTypeId +
                ", leavesCount=" + leavesCount +
                ", status='" + status + '\'' +
                '}';
    }
}
