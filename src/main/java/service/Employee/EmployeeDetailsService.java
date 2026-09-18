package service.Employee;

import models.Employees.EmployeeBankDetails;
import models.Employees.EmployeeDetails;
import models.Employees.EmployeeEducationDetails;
import models.Employees.EmployeeFamilyDetails;
import models.Projects.AllProjects;

import java.util.List;

public interface EmployeeDetailsService {

    EmployeeDetails getEmployeeDetails(int userId);
    void addEducationDetails(EmployeeEducationDetails education);

    void addBankDetails(EmployeeBankDetails bankDetails);

    void addFamilyDetails(EmployeeFamilyDetails familyDetails);


    EmployeeBankDetails getBankDetailsByUserId(int userId);
    EmployeeBankDetails getBankDetailsById(int bankDetailId);
    void updateBankDetails(EmployeeBankDetails bankDetails);

    EmployeeFamilyDetails getFamilyDetailsById(int familyDetailId);

    void updateFamilyDetails(EmployeeFamilyDetails familyDetails);

    EmployeeEducationDetails getEducationDetailsById(int educationDetailsId);

    void updateEducationDetails(EmployeeEducationDetails educationDetails);

    void deleteBankDetails(int bankDetailId);
    void deleteFamilyDetails(int familyDetailId);
    void deleteEducationDetails(int educationDetailsId);

    List<AllProjects> getProjectsByUserId(int userId) throws Exception;
}