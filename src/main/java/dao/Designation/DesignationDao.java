package dao.Designation;

import models.Employees.Designation;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DesignationDao {

    public List<Designation> getAllDesignations() {

        List<Designation> designations = new ArrayList<>();

        String sql = "{call GetAllDesignations()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Designation designation = new Designation();

                designation.setDesignationId(
                        resultSet.getInt("DesignationId")
                );

                designation.setDepartmentId(
                        resultSet.getInt("DepartmentId")
                );

                designation.setName(
                        resultSet.getString("Name")
                );

                int employeeCount =
                        resultSet.getInt("NoOfEmployee");

                if (resultSet.wasNull()) {
                    designation.setNoOfEmployee(null);
                } else {
                    designation.setNoOfEmployee(employeeCount);
                }

                designation.setStatus(
                        resultSet.getString("status")
                );

                if (resultSet.getTimestamp("CreatedAt") != null) {
                    designation.setCreatedAt(
                            resultSet.getTimestamp("CreatedAt")
                                    .toLocalDateTime()
                    );
                }

                designation.setCreatedBy(
                        resultSet.getString("CreatedBy")
                );

                designation.setModifiedBy(
                        resultSet.getString("ModifiedBy")
                );

                if (resultSet.getTimestamp("ModifiedAt") != null) {
                    designation.setModifiedAt(
                            resultSet.getTimestamp("ModifiedAt")
                                    .toLocalDateTime()
                    );
                }

                designations.add(designation);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return designations;
    }


    public Designation getDesignationById(int designationId) {

        Designation designation = null;

        String sql = "{call GetDesignationById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, designationId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    designation = new Designation();

                    designation.setDesignationId(
                            resultSet.getInt("DesignationId")
                    );

                    designation.setDepartmentId(
                            resultSet.getInt("DepartmentId")
                    );

                    designation.setName(
                            resultSet.getString("Name")
                    );

                    int employeeCount =
                            resultSet.getInt("NoOfEmployee");

                    if (resultSet.wasNull()) {
                        designation.setNoOfEmployee(null);
                    } else {
                        designation.setNoOfEmployee(employeeCount);
                    }

                    designation.setStatus(
                            resultSet.getString("status")
                    );

                    if (resultSet.getTimestamp("CreatedAt") != null) {
                        designation.setCreatedAt(
                                resultSet.getTimestamp("CreatedAt")
                                        .toLocalDateTime()
                        );
                    }

                    designation.setCreatedBy(
                            resultSet.getString("CreatedBy")
                    );

                    designation.setModifiedBy(
                            resultSet.getString("ModifiedBy")
                    );

                    if (resultSet.getTimestamp("ModifiedAt") != null) {
                        designation.setModifiedAt(
                                resultSet.getTimestamp("ModifiedAt")
                                        .toLocalDateTime()
                        );
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return designation;
    }


    public boolean addDesignation(Designation designation) {

        String sql = "{call AddDesignation(?,?,?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    designation.getDepartmentId()
            );

            statement.setString(
                    2,
                    designation.getName()
            );

            if (designation.getNoOfEmployee() == null) {
                statement.setNull(3, java.sql.Types.INTEGER);
            } else {
                statement.setInt(
                        3,
                        designation.getNoOfEmployee()
                );
            }

            statement.setString(
                    4,
                    designation.getStatus()
            );

            statement.setString(
                    5,
                    designation.getCreatedBy()
            );

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean updateDesignation(Designation designation) {

        String sql = "{call UpdateDesignation(?,?,?,?,?,?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    designation.getDesignationId()
            );

            statement.setInt(
                    2,
                    designation.getDepartmentId()
            );

            statement.setString(
                    3,
                    designation.getName()
            );

            if (designation.getNoOfEmployee() == null) {
                statement.setNull(4, java.sql.Types.INTEGER);
            } else {
                statement.setInt(
                        4,
                        designation.getNoOfEmployee()
                );
            }

            statement.setString(
                    5,
                    designation.getStatus()
            );

            statement.setString(
                    6,
                    designation.getModifiedBy()
            );

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean deleteDesignation(int designationId) {

        String sql = "{call DeleteDesignation(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, designationId);

            int result = statement.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}