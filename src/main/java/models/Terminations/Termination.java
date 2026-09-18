package models.Terminations;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Termination {

    private int terminationId;
    private int userId;
    private String terminationType;
    private LocalDateTime noticeDate;
    private LocalDateTime resignDate;
    private String reason;

    // For Termination List display
    private String firstName;
    private String lastName;
    private String department;

    public Termination() {
    }

    public int getTerminationId() {
        return terminationId;
    }

    public void setTerminationId(int terminationId) {
        this.terminationId = terminationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTerminationType() {
        return terminationType;
    }

    public void setTerminationType(String terminationType) {
        this.terminationType = terminationType;
    }

    public LocalDateTime getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(LocalDateTime noticeDate) {
        this.noticeDate = noticeDate;
    }

    public LocalDateTime getResignDate() {
        return resignDate;
    }

    public void setResignDate(LocalDateTime resignDate) {
        this.resignDate = resignDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getNoticeDateFormatted() {
        return noticeDate == null ? "" : noticeDate.format(DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getResignDateFormatted() {
        return resignDate == null ? "" : resignDate.format(DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getNoticeDateInput() {
        return noticeDate == null ? "" : noticeDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getResignDateInput() {
        return resignDate == null ? "" : resignDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}
