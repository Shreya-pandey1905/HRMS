package models.Payroll;

import java.time.LocalDateTime;

public class LeaveSettings {
    private Integer leaveSettingId;
    private Integer leaveTypeId;
    private String leaveType;
    private boolean active;
    private Integer defaultLeaves;
    private boolean allowCarryForward;
    private Integer maxCarryForward;
    private boolean earnedLeave;
    private String updatedBy;
    private LocalDateTime updatedAt;

    public Integer getLeaveSettingId() { return leaveSettingId; }
    public void setLeaveSettingId(Integer leaveSettingId) { this.leaveSettingId = leaveSettingId; }
    public Integer getLeaveTypeId() { return leaveTypeId; }
    public void setLeaveTypeId(Integer leaveTypeId) { this.leaveTypeId = leaveTypeId; }
    public String getLeaveType() { return leaveType; }
    public void setLeaveType(String leaveType) { this.leaveType = leaveType; }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
    public Integer getDefaultLeaves() { return defaultLeaves; }
    public void setDefaultLeaves(Integer defaultLeaves) { this.defaultLeaves = defaultLeaves; }
    public boolean isAllowCarryForward() { return allowCarryForward; }
    public void setAllowCarryForward(boolean allowCarryForward) { this.allowCarryForward = allowCarryForward; }
    public Integer getMaxCarryForward() { return maxCarryForward; }
    public void setMaxCarryForward(Integer maxCarryForward) { this.maxCarryForward = maxCarryForward; }
    public boolean isEarnedLeave() { return earnedLeave; }
    public void setEarnedLeave(boolean earnedLeave) { this.earnedLeave = earnedLeave; }
    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
