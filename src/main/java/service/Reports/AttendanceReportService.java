package service.Reports;

import models.Reports.AttendanceReport;

import java.util.List;
import java.util.Map;

public interface AttendanceReportService {

    List<AttendanceReport> getAttendanceReport();

    Map<String, Long> getStatusSummary(List<AttendanceReport> attendanceList);

    Map<String, long[]> getMonthlyChartData(List<AttendanceReport> attendanceList);
}
