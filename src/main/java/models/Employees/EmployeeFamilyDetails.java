package models.Employees;

import java.time.LocalDateTime;

public class EmployeeFamilyDetails {

    private int FamilyDetailId;
    private String Name;
    private String Relation;
    private LocalDateTime DateOfBirth;
    private String phone;
    private int UserId;

    public int getFamilyDetailId() {
        return FamilyDetailId;
    }

    public void setFamilyDetailId(int familyDetailId) {
        FamilyDetailId = familyDetailId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getRelation() {
        return Relation;
    }

    public void setRelation(String relation) {
        Relation = relation;
    }

    public LocalDateTime getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }
}