package serviceImplementer.Reports;

import dao.Reports.EmployeeReportDao;
import models.Reports.EmployeeReport;
import service.Reports.EmployeeReportService;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class EmployeeReportServiceImpl implements EmployeeReportService {

    private EmployeeReportDao employeeReportDao = new EmployeeReportDao();

    @Override
    public List<EmployeeReport> getEmployeeReport() {
        return employeeReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<EmployeeReport> employeeList) {

        long active = 0;
        long inactive = 0;
        long newThisYear = 0;

        int currentYear = LocalDateTime.now().getYear();

        for (EmployeeReport employee : employeeList) {

            if ("Active".equalsIgnoreCase(employee.getStatus())) {
                active++;
            } else if ("Inactive".equalsIgnoreCase(employee.getStatus())) {
                inactive++;
            }

            if (employee.getDateOfJoining() != null
                    && employee.getDateOfJoining().getYear() == currentYear) {
                newThisYear++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalEmployees", (long) employeeList.size());
        summary.put("activeEmployees", active);
        summary.put("inactiveEmployees", inactive);
        summary.put("newEmployees", newThisYear);

        return summary;
    }

    @Override
    public Map<String, long[]> getJoinMonthChartData(List<EmployeeReport> employeeList) {

        // key = "yyyy-MM", value = [activeCount, inactiveCount]
        Map<String, long[]> chartData = new TreeMap<>();

        for (EmployeeReport employee : employeeList) {

            // Some seed rows use '0001-01-01' as a placeholder for "no
            // joining date recorded" rather than a real date - skip those
            // so they don't show up as a bogus month on the chart.
            if (employee.getDateOfJoining() == null
                    || employee.getDateOfJoining().getYear() < 1900) {
                continue;
            }

            String month = employee.getDateOfJoining().getYear()
                    + "-"
                    + String.format("%02d", employee.getDateOfJoining().getMonthValue());

            chartData.putIfAbsent(month, new long[2]);

            long[] counts = chartData.get(month);

            if ("Active".equalsIgnoreCase(employee.getStatus())) {
                counts[0]++;
            } else if ("Inactive".equalsIgnoreCase(employee.getStatus())) {
                counts[1]++;
            }
        }

        return chartData;
    }
}
