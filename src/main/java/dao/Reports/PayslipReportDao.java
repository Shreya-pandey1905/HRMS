package dao.Reports;

import models.Reports.PayslipReport;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PayslipReportDao {

    public List<PayslipReport> getAll() {

        List<PayslipReport> payslipList = new ArrayList<>();

        String sql = "{CALL GetPayslipReport()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                PayslipReport payslip = new PayslipReport();

                payslip.setPayslipId(resultSet.getInt("PayslipId"));
                payslip.setEmployeeName(resultSet.getString("EmployeeName"));
                payslip.setPaidAmount(resultSet.getDouble("PaidAmount"));
                payslip.setPaidMonth(resultSet.getString("PaidMonth"));
                payslip.setPaidYear(resultSet.getInt("PaidYear"));

                payslipList.add(payslip);
            }

        } catch (Exception e) {

            throw new RuntimeException(
                    "Unable to fetch payslip report",
                    e
            );
        }

        return payslipList;
    }
}
