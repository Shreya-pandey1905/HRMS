package service.Reports;

import models.Reports.LeaveReport;

import java.util.List;
import java.util.Map;

public interface LeaveReportService {

    List<LeaveReport> getLeaveReport();

    Map<String, Long> getStatusSummary(List<LeaveReport> leaveList);

    Map<String, Long> getLeaveTypeChartData(List<LeaveReport> leaveList);
}
