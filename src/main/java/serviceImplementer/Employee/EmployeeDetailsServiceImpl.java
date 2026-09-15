package serviceImplementer.Employee;

import dao.Employee.EmployeeDetailsDao;
import dao.Projects.ProjectDao;
import models.Employees.EmployeeBankDetails;
import models.Employees.EmployeeDetails;
import models.Employees.EmployeeEducationDetails;
import models.Employees.EmployeeFamilyDetails;
import models.Projects.AllProjects;
import service.Employee.EmployeeDetailsService;

import java.util.List;

public class EmployeeDetailsServiceImpl implements EmployeeDetailsService {

    private EmployeeDetailsDao employeeDetailsDao;

    public EmployeeDetailsServiceImpl() {
        employeeDetailsDao = new EmployeeDetailsDao();
    }

      @Override
    public EmployeeDetails getEmployeeDetails(int userId) {
        return employeeDetailsDao.getEmployeeDetails(userId);
    }

    @Override
    public void addEducationDetails(EmployeeEducationDetails education) {
        employeeDetailsDao.addEducationDetails(education);

    }

    @Override
    public void addBankDetails(EmployeeBankDetails bankDetails) {
        employeeDetailsDao.addBankDetails(bankDetails);
    }

    @Override
    public void addFamilyDetails(EmployeeFamilyDetails familyDetails) {
        employeeDetailsDao.addFamilyDetails(familyDetails);
    }

    @Override
    public EmployeeBankDetails getBankDetailsByUserId(int userId) {
        return employeeDetailsDao.getBankDetailsByUserId(userId);
    }

    @Override
    public EmployeeBankDetails getBankDetailsById(int bankDetailId) {
        return employeeDetailsDao.getBankDetailsById(bankDetailId);
    }
    @Override
    public List<AllProjects> getProjectsByUserId(int userId) throws Exception {
        return employeeDetailsDao.getProjectsByUserId(userId);
    }


    @Override
    public void updateBankDetails(EmployeeBankDetails bankDetails) {
        employeeDetailsDao.updateBankDetails(bankDetails);
    }
    @Override
    public EmployeeFamilyDetails getFamilyDetailsById(int familyDetailId) {
        return employeeDetailsDao.getFamilyDetailsById(familyDetailId);
    }

    @Override
    public void updateFamilyDetails(EmployeeFamilyDetails familyDetails) {
        employeeDetailsDao.updateFamilyDetails(familyDetails);
    }

    @Override
    public EmployeeEducationDetails getEducationDetailsById(
            int educationDetailsId) {

        return employeeDetailsDao
                .getEducationDetailsById(educationDetailsId);
    }

    @Override
    public void updateEducationDetails(
            EmployeeEducationDetails educationDetails) {

        employeeDetailsDao.updateEducationDetails(educationDetails);
    }

    @Override
    public void deleteBankDetails(int bankDetailId) {
        employeeDetailsDao.deleteBankDetails(bankDetailId);
    }

    @Override
    public void deleteFamilyDetails(int familyDetailId) {
        employeeDetailsDao.deleteFamilyDetails(familyDetailId);
    }

    @Override
    public void deleteEducationDetails(int educationDetailsId) {
        employeeDetailsDao.deleteEducationDetails(educationDetailsId);
    }


}