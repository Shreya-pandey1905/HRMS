package dao.Employee;

import models.Employees.EmployeeBankDetails;
import models.Employees.EmployeeDetails;
import models.Employees.EmployeeEducationDetails;
import models.Employees.EmployeeFamilyDetails;
import models.Employees.User;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDetailsDao {

    public EmployeeDetails getEmployeeDetails(int userId) {

        EmployeeDetails employeeDetails = new EmployeeDetails();

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall("{call GetEmployeeCompleteDetails(?)}")) {

            cs.setInt(1, userId);

            boolean hasResult = cs.execute();

            System.out.println("START DETAILS: " + userId);

            // =====================================================
            // RESULT SET 1 - USER DETAILS
            // =====================================================

            if (hasResult) {

                try (ResultSet rs = cs.getResultSet()) {

                    if (rs.next()) {

                        User user = new User();

                        user.setUserId(rs.getInt("UserId"));
                        user.setFirstName(rs.getString("FirstName"));
                        user.setLastName(rs.getString("LastName"));
                        user.setEmail(rs.getString("Email"));
                        user.setPhoneNumber(rs.getString("PhoneNumber"));

                        user.setRoleId(rs.getInt("RoleId"));
                        user.setDepartmentId(rs.getInt("DepartmentId"));
                        user.setDesignationId(rs.getInt("DesignationId"));

                        if (rs.getTimestamp("DateOfJoining") != null) {
                            user.setDateOfJoining(
                                    rs.getTimestamp("DateOfJoining")
                                            .toLocalDateTime()
                            );
                        }

                        if (rs.getTimestamp("DateOfBirth") != null) {
                            user.setDateOfBirth(
                                    rs.getTimestamp("DateOfBirth")
                                            .toLocalDateTime()
                            );
                        }

                        user.setGender(rs.getString("Gender"));
                        user.setAddress(rs.getString("Address"));
                        user.setAboutEmployee(rs.getString("AboutEmployee"));
                        user.setProfilePicture(rs.getString("ProfilePicture"));
                        user.setReportingManager(rs.getString("ReportingManager"));

                        if (rs.getTimestamp("CreatedAt") != null) {
                            user.setCreatedAt(
                                    rs.getTimestamp("CreatedAt")
                                            .toLocalDateTime()
                            );
                        }

                        user.setCreatedBy(rs.getString("CreatedBy"));
                        user.setModifiedBy(rs.getString("ModifiedBy"));

                        if (rs.getTimestamp("ModifiedAt") != null) {
                            user.setModifiedAt(
                                    rs.getTimestamp("ModifiedAt")
                                            .toLocalDateTime()
                            );
                        }

                        user.setStatus(rs.getString("Status"));

                        employeeDetails.setUser(user);
                    }
                }
            }

            System.out.println("USER RESULT DONE");

            // =====================================================
            // RESULT SET 2 - BANK DETAILS
            // =====================================================

            hasResult = cs.getMoreResults();

            if (hasResult) {

                try (ResultSet rs = cs.getResultSet()) {

                    if (rs.next()) {

                        EmployeeBankDetails bankDetails =
                                new EmployeeBankDetails();

                        bankDetails.setBankDetailId(
                                rs.getInt("BankDetailId")
                        );

                        bankDetails.setBankName(
                                rs.getString("BankName")
                        );

                        bankDetails.setAccountNumber(
                                rs.getString("AccountNumber")
                        );

                        bankDetails.setIFSCCode(
                                rs.getString("IFSCCode")
                        );

                        bankDetails.setBranchName(
                                rs.getString("BranchName")
                        );

                        bankDetails.setUserId(
                                rs.getInt("UserId")
                        );

                        employeeDetails.setBankDetails(bankDetails);
                    }
                }
            }

            System.out.println("BANK RESULT DONE");

            // =====================================================
            // RESULT SET 3 - FAMILY DETAILS
            // =====================================================

            hasResult = cs.getMoreResults();

            List<EmployeeFamilyDetails> familyDetails =
                    new ArrayList<>();

            if (hasResult) {

                try (ResultSet rs = cs.getResultSet()) {

                    while (rs.next()) {

                        EmployeeFamilyDetails family =
                                new EmployeeFamilyDetails();

                        family.setFamilyDetailId(
                                rs.getInt("FamilyDetailId")
                        );

                        family.setName(
                                rs.getString("Name")
                        );

                        family.setRelation(
                                rs.getString("Relation")
                        );

                        if (rs.getTimestamp("DateOfBirth") != null) {
                            family.setDateOfBirth(
                                    rs.getTimestamp("DateOfBirth")
                                            .toLocalDateTime()
                            );
                        }

                        family.setPhone(
                                rs.getString("Phone")
                        );

                        family.setUserId(
                                rs.getInt("UserId")
                        );

                        familyDetails.add(family);
                    }
                }
            }

            employeeDetails.setFamilyDetails(familyDetails);

            System.out.println("FAMILY RESULT DONE");

            // =====================================================
            // RESULT SET 4 - EDUCATION DETAILS
            // =====================================================

            hasResult = cs.getMoreResults();

            List<EmployeeEducationDetails> educationDetails =
                    new ArrayList<>();

            if (hasResult) {

                try (ResultSet rs = cs.getResultSet()) {

                    while (rs.next()) {

                        EmployeeEducationDetails education =
                                new EmployeeEducationDetails();

                        education.setEducationDetailsId(
                                rs.getInt("EducationDetailsId")
                        );

                        education.setEducationType(
                                rs.getString("EducationType")
                        );

                        education.setUniversityName(
                                rs.getString("UniversityName")
                        );

                        education.setUserId(
                                rs.getInt("UserId")
                        );

                        if (rs.getTimestamp("startdate") != null) {
                            education.setStartdate(
                                    rs.getTimestamp("startdate")
                                            .toLocalDateTime()
                            );
                        }

                        if (rs.getTimestamp("enddate") != null) {
                            education.setEnddate(
                                    rs.getTimestamp("enddate")
                                            .toLocalDateTime()
                            );
                        }

                        educationDetails.add(education);
                    }
                }
            }

            employeeDetails.setEducationDetails(educationDetails);

            System.out.println("EDUCATION RESULT DONE");
            System.out.println("END DETAILS: " + userId);

        } catch (Exception e) {

            System.out.println(
                    "ERROR WHILE FETCHING EMPLOYEE DETAILS: " + userId
            );

            e.printStackTrace();
        }

        return employeeDetails;
    }
}