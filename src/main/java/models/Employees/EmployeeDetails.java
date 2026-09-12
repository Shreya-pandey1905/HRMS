package models.Employees;

import java.util.List;

public class EmployeeDetails {

    private User user;
    private Department department;
    private Designation designation;
    private EmployeeBankDetails bankDetails;
    private List<EmployeeFamilyDetails> familyDetails;
    private List<EmployeeEducationDetails> educationDetails;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Designation getDesignation() {
        return designation;
    }

    public void setDesignation(Designation designation) {
        this.designation = designation;
    }

    public EmployeeBankDetails getBankDetails() {
        return bankDetails;
    }

    public void setBankDetails(EmployeeBankDetails bankDetails) {
        this.bankDetails = bankDetails;
    }

    public List<EmployeeFamilyDetails> getFamilyDetails() {
        return familyDetails;
    }

    public void setFamilyDetails(List<EmployeeFamilyDetails> familyDetails) {
        this.familyDetails = familyDetails;
    }

    public List<EmployeeEducationDetails> getEducationDetails() {
        return educationDetails;
    }

    public void setEducationDetails(List<EmployeeEducationDetails> educationDetails) {
        this.educationDetails = educationDetails;
    }
}