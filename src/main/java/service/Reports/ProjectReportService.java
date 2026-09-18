package service.Reports;

import models.Reports.ProjectReport;

import java.util.List;
import java.util.Map;

public interface ProjectReportService {

    List<ProjectReport> getProjectReport();

    Map<String, Long> getStatusSummary(List<ProjectReport> projectList);
}
