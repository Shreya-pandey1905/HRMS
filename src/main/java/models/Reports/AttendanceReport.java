package models.Reports;

import java.time.LocalDateTime;

public class AttendanceReport {

    private int attendanceId;
    private int userId;

    private LocalDateTime date;
    private LocalDateTime checkIn;
    private LocalDateTime checkOut;
    private LocalDateTime lunchIn;
    private LocalDateTime lunchOut;

    private double workingHours;
    private double productionHours;
    private double overtimeHours;
    private double breakHours;

    private int late;
    private String status;

    public AttendanceReport() {
    }

    public int getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public double getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(double workingHours) {
        this.workingHours = workingHours;
    }

    public double getProductionHours() {
        return productionHours;
    }

    public void setProductionHours(double productionHours) {
        this.productionHours = productionHours;
    }

    public double getOvertimeHours() {
        return overtimeHours;
    }

    public void setOvertimeHours(double overtimeHours) {
        this.overtimeHours = overtimeHours;
    }

    public double getBreakHours() {
        return breakHours;
    }

    public void setBreakHours(double breakHours) {
        this.breakHours = breakHours;
    }

    public int getLate() {
        return late;
    }

    public void setLate(int late) {
        this.late = late;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}