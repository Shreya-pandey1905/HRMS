package service.Reports;

import models.Reports.TaskReport;

import java.util.List;
import java.util.Map;

public interface TaskReportService {

    List<TaskReport> getTaskReport();

    Map<String, Long> getStatusSummary(List<TaskReport> taskList);
}
