package models.Payroll;

public class MasterLeaveTypes {

    private Integer leaveTypeId;
    private String leaveType;
    private boolean active;

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "MasterLeaveTypes{" +
                "leaveTypeId=" + leaveTypeId +
                ", leaveType='" + leaveType + '\'' +
                '}';
    }
}