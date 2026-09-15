package dao.Employee;

import models.Employees.EmployeeBankDetails;
import models.Employees.EmployeeDetails;
import models.Employees.EmployeeEducationDetails;
import models.Employees.EmployeeFamilyDetails;
import models.Employees.User;
import models.Projects.AllProjects;
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

            List<EmployeeBankDetails> bankDetails =
                    new ArrayList<>();

            if (hasResult) {

                try (ResultSet rs = cs.getResultSet()) {

                    while (rs.next()) {

                        EmployeeBankDetails bank =
                                new EmployeeBankDetails();

                        bank.setBankDetailId(
                                rs.getInt("BankDetailId")
                        );

                        bank.setBankName(
                                rs.getString("BankName")
                        );

                        bank.setAccountNumber(
                                rs.getString("AccountNumber")
                        );

                        bank.setIFSCCode(
                                rs.getString("IFSCCode")
                        );

                        bank.setBranchName(
                                rs.getString("BranchName")
                        );

                        bank.setUserId(
                                rs.getInt("UserId")
                        );

                        bankDetails.add(bank);
                    }
                }
            }

            employeeDetails.setBankDetails(bankDetails);

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
                                rs.getString("phone")
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

    public void addEducationDetails(EmployeeEducationDetails education) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call AddEducationDetails(?,?,?,?,?)}")) {

            cs.setString(1, education.getEducationType());
            cs.setString(2, education.getUniversityName());
            cs.setInt(3, education.getUserId());

            if (education.getStartdate() != null) {
                cs.setObject(4, education.getStartdate());
            } else {
                cs.setNull(4, java.sql.Types.TIMESTAMP);
            }

            if (education.getEnddate() != null) {
                cs.setObject(5, education.getEnddate());
            } else {
                cs.setNull(5, java.sql.Types.TIMESTAMP);
            }

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE ADDING EDUCATION DETAILS");
            e.printStackTrace();
        }
    }

    public void addBankDetails(EmployeeBankDetails bankDetails) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call AddEmployeeBankDetails(?,?,?,?,?)}")) {

            cs.setString(1, bankDetails.getBankName());
            cs.setString(2, bankDetails.getAccountNumber());
            cs.setString(3, bankDetails.getIFSCCode());
            cs.setString(4, bankDetails.getBranchName());
            cs.setInt(5, bankDetails.getUserId());

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE ADDING BANK DETAILS");
            e.printStackTrace();
        }
    }

    public void addFamilyDetails(EmployeeFamilyDetails familyDetails) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call AddEmployeeFamilyDetails(?,?,?,?,?)}")) {

            cs.setString(1, familyDetails.getName());
            cs.setString(2, familyDetails.getRelation());

            if (familyDetails.getDateOfBirth() != null) {
                cs.setObject(3, familyDetails.getDateOfBirth());
            } else {
                cs.setNull(3, java.sql.Types.TIMESTAMP);
            }

            cs.setString(4, familyDetails.getPhone());
            cs.setInt(5, familyDetails.getUserId());

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE ADDING FAMILY DETAILS");
            e.printStackTrace();
        }
    }

    public EmployeeBankDetails getBankDetailsByUserId(int userId) {

        EmployeeBankDetails bankDetails = null;

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call GetBankDetailsByUserId(?)}")) {

            cs.setInt(1, userId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                bankDetails = new EmployeeBankDetails();

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
            }

        } catch (Exception e) {
            System.out.println("ERROR WHILE FETCHING BANK DETAILS");
            e.printStackTrace();
        }

        return bankDetails;
    }

    public EmployeeBankDetails getBankDetailsById(int bankDetailId) {
        EmployeeBankDetails bankDetails = null;

        try {
            Connection connection = DBConfig.getConnection();

            CallableStatement statement =
                    connection.prepareCall("{call GetBankDetailsById(?)}");

            statement.setInt(1, bankDetailId);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                bankDetails = new EmployeeBankDetails();

                bankDetails.setBankDetailId(
                        resultSet.getInt("BankDetailId")
                );
                bankDetails.setBankName(
                        resultSet.getString("BankName")
                );
                bankDetails.setAccountNumber(
                        resultSet.getString("AccountNumber")
                );
                bankDetails.setIFSCCode(
                        resultSet.getString("IFSCCode")
                );
                bankDetails.setBranchName(
                        resultSet.getString("BranchName")
                );
                bankDetails.setUserId(
                        resultSet.getInt("UserId")
                );
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bankDetails;
    }

    public void updateBankDetails(EmployeeBankDetails bankDetails) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call UpdateEmployeeBankDetails(?,?,?,?,?)}")) {

            cs.setInt(1, bankDetails.getBankDetailId());
            cs.setString(2, bankDetails.getBankName());
            cs.setString(3, bankDetails.getAccountNumber());
            cs.setString(4, bankDetails.getIFSCCode());
            cs.setString(5, bankDetails.getBranchName());

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE UPDATING BANK DETAILS");
            e.printStackTrace();
        }
    }

    public EmployeeFamilyDetails getFamilyDetailsById(int familyDetailId) {

        EmployeeFamilyDetails familyDetails = null;

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call GetFamilyDetailsById(?)}")) {

            cs.setInt(1, familyDetailId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                familyDetails = new EmployeeFamilyDetails();

                familyDetails.setFamilyDetailId(
                        rs.getInt("FamilyDetailId")
                );

                familyDetails.setName(
                        rs.getString("Name")
                );

                familyDetails.setRelation(
                        rs.getString("Relation")
                );

                if (rs.getTimestamp("DateOfBirth") != null) {
                    familyDetails.setDateOfBirth(
                            rs.getTimestamp("DateOfBirth")
                                    .toLocalDateTime()
                    );
                }

                familyDetails.setPhone(
                        rs.getString("phone")
                );

                familyDetails.setUserId(
                        rs.getInt("UserId")
                );
            }

        } catch (Exception e) {
            System.out.println("ERROR WHILE FETCHING FAMILY DETAILS");
            e.printStackTrace();
        }

        return familyDetails;
    }

    public void updateFamilyDetails(EmployeeFamilyDetails familyDetails) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call UpdateEmployeeFamilyDetails(?,?,?,?,?)}")) {

            cs.setInt(1, familyDetails.getFamilyDetailId());
            cs.setString(2, familyDetails.getName());
            cs.setString(3, familyDetails.getRelation());

            if (familyDetails.getDateOfBirth() != null) {
                cs.setObject(4, familyDetails.getDateOfBirth());
            } else {
                cs.setNull(4, java.sql.Types.TIMESTAMP);
            }

            cs.setString(5, familyDetails.getPhone());

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE UPDATING FAMILY DETAILS");
            e.printStackTrace();
        }
    }

    public EmployeeEducationDetails getEducationDetailsById(
            int educationDetailsId) {

        EmployeeEducationDetails educationDetails = null;

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call GetEducationDetailsById(?)}")) {

            cs.setInt(1, educationDetailsId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                educationDetails = new EmployeeEducationDetails();

                educationDetails.setEducationDetailsId(
                        rs.getInt("EducationDetailsId")
                );

                educationDetails.setEducationType(
                        rs.getString("EducationType")
                );

                educationDetails.setUniversityName(
                        rs.getString("UniversityName")
                );

                educationDetails.setUserId(
                        rs.getInt("UserId")
                );

                if (rs.getTimestamp("startdate") != null) {
                    educationDetails.setStartdate(
                            rs.getTimestamp("startdate")
                                    .toLocalDateTime()
                    );
                }

                if (rs.getTimestamp("enddate") != null) {
                    educationDetails.setEnddate(
                            rs.getTimestamp("enddate")
                                    .toLocalDateTime()
                    );
                }
            }

        } catch (Exception e) {
            System.out.println("ERROR WHILE FETCHING EDUCATION DETAILS");
            e.printStackTrace();
        }

        return educationDetails;
    }

    public void updateEducationDetails(
            EmployeeEducationDetails educationDetails) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call UpdateEducationDetails(?,?,?,?,?)}")) {

            cs.setInt(
                    1,
                    educationDetails.getEducationDetailsId()
            );

            cs.setString(
                    2,
                    educationDetails.getEducationType()
            );

            cs.setString(
                    3,
                    educationDetails.getUniversityName()
            );

            if (educationDetails.getStartdate() != null) {
                cs.setObject(
                        4,
                        educationDetails.getStartdate()
                );
            } else {
                cs.setNull(
                        4,
                        java.sql.Types.TIMESTAMP
                );
            }

            if (educationDetails.getEnddate() != null) {
                cs.setObject(
                        5,
                        educationDetails.getEnddate()
                );
            } else {
                cs.setNull(
                        5,
                        java.sql.Types.TIMESTAMP
                );
            }

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE UPDATING EDUCATION DETAILS");
            e.printStackTrace();
        }
    }

    public void deleteBankDetails(int bankDetailId) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call DeleteEmployeeBankDetails(?)}")) {

            cs.setInt(1, bankDetailId);

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE DELETING BANK DETAILS");
            e.printStackTrace();
        }
    }

    public void deleteFamilyDetails(int familyDetailId) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call DeleteEmployeeFamilyDetails(?)}")) {

            cs.setInt(1, familyDetailId);

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE DELETING FAMILY DETAILS");
            e.printStackTrace();
        }
    }

    public void deleteEducationDetails(int educationDetailsId) {

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs =
                     connection.prepareCall(
                             "{call DeleteEducationDetails(?)}")) {

            cs.setInt(1, educationDetailsId);

            cs.execute();

        } catch (Exception e) {
            System.out.println("ERROR WHILE DELETING EDUCATION DETAILS");
            e.printStackTrace();
        }
    }

    public List<AllProjects> getProjectsByUserId(int userId) throws Exception {

        List<AllProjects> projects = new ArrayList<>();

        String sql = "{CALL sp_get_projects_by_user_id(?)}";

        System.out.println("DAO PROJECT METHOD CALLED: " + userId);

        try (Connection connection = DBConfig.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, userId);

            System.out.println("EXECUTING PROJECT PROCEDURE");

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {

                    System.out.println("PROJECT ROW FOUND");

                    AllProjects project = new AllProjects();

                    project.setProjectId(
                            rs.getInt("ProjectId")
                    );

                    project.setProjectName(
                            rs.getString("ProjectName")
                    );

                    project.setClientName(
                            rs.getString("ClientName")
                    );

                    project.setStartDate(
                            rs.getTimestamp("StartDate") != null
                                    ? rs.getTimestamp("StartDate").toLocalDateTime()
                                    : null
                    );

                    project.setEndDate(
                            rs.getTimestamp("EndDate") != null
                                    ? rs.getTimestamp("EndDate").toLocalDateTime()
                                    : null
                    );

                    project.setPriority(
                            rs.getString("Priority")
                    );

                    project.setStatus(
                            rs.getString("Status")
                    );

                    project.setManagerName(
                            rs.getString("ManagerName")
                    );

                    projects.add(project);
                }
            }
        }

        System.out.println("DAO PROJECT COUNT: " + projects.size());

        return projects;
    }
}