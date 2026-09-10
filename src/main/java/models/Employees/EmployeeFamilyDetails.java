package models.Employees;

import java.time.LocalDateTime;

public class EmployeeFamilyDetails {

    private int FamilyDetailId;

    public int UserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String phone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime DateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String Relation() {
        return Relation;
    }

    public void setRelation(String relation) {
        Relation = relation;
    }

    public String Name() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int FamilyDetailId() {
        return FamilyDetailId;
    }

    public void setFamilyDetailId(int familyDetailId) {
        FamilyDetailId = familyDetailId;
    }

    private String Name;
    private String Relation;
    private LocalDateTime DateOfBirth;
    private String phone;
    private int UserId;

}