package models.Payroll;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Attendance {

    private Integer attendanceId;
    private Integer userId;
    private LocalDateTime date;
    private LocalDateTime checkIn;
    private LocalDateTime checkOut;
    private LocalDateTime lunchIn;
    private LocalDateTime lunchOut;
    private BigDecimal workingHours;
    private BigDecimal productionHours;
    private BigDecimal overtimeHours;
    private BigDecimal breakHours;
    private Integer late;
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

    public LocalDateTime getLunchIn() {
        return lunchIn;
    }

    public void setLunchIn(LocalDateTime lunchIn) {
        this.lunchIn = lunchIn;
    }

    public LocalDateTime getLunchOut() {
        return lunchOut;
    }

    public void setLunchOut(LocalDateTime lunchOut) {
        this.lunchOut = lunchOut;
    }

    public BigDecimal getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(BigDecimal workingHours) {
        this.workingHours = workingHours;
    }

    public BigDecimal getProductionHours() {
        return productionHours;
    }

    public void setProductionHours(BigDecimal productionHours) {
        this.productionHours = productionHours;
    }

    public BigDecimal getOvertimeHours() {
        return overtimeHours;
    }

    public void setOvertimeHours(BigDecimal overtimeHours) {
        this.overtimeHours = overtimeHours;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getDateLabel() {
        return date == null ? "-" : date.format(java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getCheckInLabel() {
        return formatTime(checkIn);
    }

    public String getCheckOutLabel() {
        return formatTime(checkOut);
    }

    public String getLunchInLabel() {
        return formatTime(lunchIn);
    }

    public String getLunchOutLabel() {
        return formatTime(lunchOut);
    }

    public String getBreakHoursLabel() {
        return formatHours(breakHours);
    }

    public String getProductionHoursLabel() {
        return formatHours(productionHours);
    }

    public String getOvertimeHoursLabel() {
        return formatHours(overtimeHours);
    }

    public String getWorkingHoursLabel() {
        return formatHours(workingHours);
    }

    public String getProductionBadgeClass() {
        return productionHours != null && productionHours.compareTo(java.math.BigDecimal.ZERO) > 0
                ? "badge-success-transparent" : "badge-light";
    }

    private String formatTime(LocalDateTime value) {
        return value == null ? "-" : value.format(java.time.format.DateTimeFormatter.ofPattern("hh:mm a"));
    }

    private String formatHours(BigDecimal value) {
        if (value == null || value.compareTo(BigDecimal.ZERO) == 0) return "0h 0m";
        long totalMinutes = value.multiply(BigDecimal.valueOf(60)).setScale(0, java.math.RoundingMode.HALF_UP).longValue();
        return (totalMinutes / 60) + "h " + (totalMinutes % 60) + "m";
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "attendanceId=" + attendanceId +
                ", userId=" + userId +
                ", date=" + date +
                ", checkIn=" + checkIn +
                ", checkOut=" + checkOut +
                ", lunchIn=" + lunchIn +
                ", lunchOut=" + lunchOut +
                ", workingHours=" + workingHours +
                ", productionHours=" + productionHours +
                ", overtimeHours=" + overtimeHours +
                ", breakHours=" + breakHours +
                ", late=" + late +
                ", status='" + status + '\'' +
                '}';
    }
}
