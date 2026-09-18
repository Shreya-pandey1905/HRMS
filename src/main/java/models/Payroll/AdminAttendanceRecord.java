package models.Payroll;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AdminAttendanceRecord {

    private Integer attendanceId;
    private Integer userId;
    private String firstName;
    private String lastName;
    private String departmentName;
    private String profilePicture;
    private LocalDateTime date;
    private LocalDateTime checkIn;
    private LocalDateTime checkOut;
    private BigDecimal breakHours = BigDecimal.ZERO;
    private Integer late = 0;
    private BigDecimal productionHours = BigDecimal.ZERO;
    private BigDecimal workingHours = BigDecimal.ZERO;
    private BigDecimal overtimeHours = BigDecimal.ZERO;
    private String status;

    public Integer getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(Integer attendanceId) {
        this.attendanceId = attendanceId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFullName() {
        String name = ((firstName == null ? "" : firstName) + " "
                + (lastName == null ? "" : lastName)).trim();

        return name.isEmpty() ? "Employee" : name;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public LocalDateTime getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(LocalDateTime checkIn) {
        this.checkIn = checkIn;
    }

    public LocalDateTime getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(LocalDateTime checkOut) {
        this.checkOut = checkOut;
    }

    public BigDecimal getBreakHours() {
        return breakHours;
    }

    public void setBreakHours(BigDecimal breakHours) {
        this.breakHours = breakHours;
    }

    public Integer getLate() {
        return late;
    }

    public void setLate(Integer late) {
        this.late = late;
    }

    public BigDecimal getProductionHours() {
        return productionHours;
    }

    public void setProductionHours(BigDecimal productionHours) {
        this.productionHours = productionHours;
    }

    public BigDecimal getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(BigDecimal workingHours) {
        this.workingHours = workingHours;
    }

    public BigDecimal getOvertimeHours() {
        return overtimeHours;
    }

    public void setOvertimeHours(BigDecimal overtimeHours) {
        this.overtimeHours = overtimeHours;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDateLabel() {
        return date == null
                ? "-"
                : date.format(DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getCheckInLabel() {
        return formatTime(checkIn);
    }

    public String getCheckOutLabel() {
        return formatTime(checkOut);
    }

    public String getBreakLabel() {
        return formatHours(breakHours);
    }

    public String getProductionHoursLabel() {
        return formatHours(productionHours);
    }

    public String getWorkingHoursLabel() {
        return formatHours(workingHours);
    }

    public String getLateLabel() {
        int minutes = late == null ? 0 : late;

        if (minutes <= 0) {
            return "-";
        }

        return minutes + " Min";
    }

    public String getStatusLabel() {
        if (status == null || status.trim().isEmpty()) {
            return "Absent";
        }

        return status;
    }

    public String getStatusBadgeClass() {
        return "Present".equalsIgnoreCase(getStatusLabel())
                ? "badge-success-transparent"
                : "badge-danger-transparent";
    }

    public String getProductionBadgeClass() {
        return productionHours != null
                && productionHours.compareTo(BigDecimal.ZERO) > 0
                ? "badge-success"
                : "badge-danger";
    }

    private String formatTime(LocalDateTime value) {
        return value == null
                ? "-"
                : value.format(DateTimeFormatter.ofPattern("hh:mm a"));
    }

    private String formatHours(BigDecimal value) {
        if (value == null || value.compareTo(BigDecimal.ZERO) == 0) {
            return "0.00 Hrs";
        }

        return value.setScale(2, RoundingMode.HALF_UP).toPlainString()
                + " Hrs";
    }
}