package service.Reports;

import models.Reports.DailyReport;

import java.util.List;
import java.util.Map;

public interface DailyReportService {

    List<DailyReport> getDailyReport();

    Map<String, Long> getStatusSummary(List<DailyReport> dailyList);
}
