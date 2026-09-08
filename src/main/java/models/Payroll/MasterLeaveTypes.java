package models.Payroll;

public class MasterLeaveTypes {

    private Integer leaveTypeId;
    private String leaveType;

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

    @Override
    public String toString() {
        return "MasterLeaveTypes{" +
                "leaveTypeId=" + leaveTypeId +
                ", leaveType='" + leaveType + '\'' +
                '}';
    }
}