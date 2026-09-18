package service.Reports;

import models.Reports.EmployeeReport;

import java.util.List;
import java.util.Map;

public interface EmployeeReportService {

    List<EmployeeReport> getEmployeeReport();

    Map<String, Long> getStatusSummary(List<EmployeeReport> employeeList);

    Map<String, long[]> getJoinMonthChartData(List<EmployeeReport> employeeList);
}
