package models.Employees;

import java.time.LocalDateTime;

public class EmployeeEducationDetails {

    private int EducationDetailsId;

    public LocalDateTime enddate() {
        return enddate;
    }

    public void setEnddate(LocalDateTime enddate) {
        this.enddate = enddate;
    }

    public LocalDateTime startdate() {
        return startdate;
    }

    public void setStartdate(LocalDateTime startdate) {
        this.startdate = startdate;
    }

    public int UserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String UniversityName() {
        return UniversityName;
    }

    public void setUniversityName(String universityName) {
        UniversityName = universityName;
    }

    public String EducationType() {
        return EducationType;
    }

    public void setEducationType(String educationType) {
        EducationType = educationType;
    }

    public int EducationDetailsId() {
        return EducationDetailsId;
    }

    public void setEducationDetailsId(int educationDetailsId) {
        EducationDetailsId = educationDetailsId;
    }

    private String EducationType;
    private String UniversityName;
    private int UserId;
    private LocalDateTime startdate;
    private LocalDateTime enddate;


}