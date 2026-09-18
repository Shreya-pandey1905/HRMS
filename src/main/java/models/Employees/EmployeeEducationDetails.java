package models.Employees;

import java.time.LocalDateTime;

public class EmployeeEducationDetails {

    private int EducationDetailsId;
    private String EducationType;
    private String UniversityName;
    private int UserId;
    private LocalDateTime startdate;
    private LocalDateTime enddate;

    public int getEducationDetailsId() {
        return EducationDetailsId;
    }

    public void setEducationDetailsId(int educationDetailsId) {
        EducationDetailsId = educationDetailsId;
    }

    public String getEducationType() {
        return EducationType;
    }

    public void setEducationType(String educationType) {
        EducationType = educationType;
    }

    public String getUniversityName() {
        return UniversityName;
    }

    public void setUniversityName(String universityName) {
        UniversityName = universityName;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public LocalDateTime getStartdate() {
        return startdate;
    }

    public void setStartdate(LocalDateTime startdate) {
        this.startdate = startdate;
    }

    public LocalDateTime getEnddate() {
        return enddate;
    }

    public void setEnddate(LocalDateTime enddate) {
        this.enddate = enddate;
    }
}