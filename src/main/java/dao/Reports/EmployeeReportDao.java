package dao.Reports;

import models.Reports.EmployeeReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class EmployeeReportDao {

    public List<EmployeeReport> getAll() {

        List<EmployeeReport> employeeList = new ArrayList<>();

        String sql = "{CALL GetEmployeeReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                EmployeeReport employee = new EmployeeReport();

                employee.setUserId(resultSet.getInt("UserId"));
                employee.setEmployeeName(resultSet.getString("EmployeeName"));
                employee.setEmail(resultSet.getString("Email"));
                employee.setDepartmentName(resultSet.getString("DepartmentName"));
                employee.setPhoneNumber(resultSet.getString("PhoneNumber"));

                Timestamp dateOfJoining = resultSet.getTimestamp("DateOfJoining");
                if (dateOfJoining != null) {
                    employee.setDateOfJoining(dateOfJoining.toLocalDateTime());
                }

                employee.setStatus(resultSet.getString("Status"));

                employeeList.add(employee);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch employee report",
                    e
            );
        }

        return employeeList;
    }
}
