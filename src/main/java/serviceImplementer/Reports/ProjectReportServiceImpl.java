package serviceImplementer.Reports;

import dao.Reports.ProjectReportDao;
import models.Reports.ProjectReport;
import service.Reports.ProjectReportService;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProjectReportServiceImpl implements ProjectReportService {

    private ProjectReportDao projectReportDao = new ProjectReportDao();

    @Override
    public List<ProjectReport> getProjectReport() {
        return projectReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<ProjectReport> projectList) {

        long active = 0;
        long inactive = 0;
        long overdue = 0;

        LocalDateTime now = LocalDateTime.now();

        for (ProjectReport project : projectList) {

            String status = project.getStatus();

            if ("Active".equalsIgnoreCase(status)) {
                active++;
            } else if ("Inactive".equalsIgnoreCase(status)) {
                inactive++;
            }

            if (project.getEndDate() != null && project.getEndDate().isBefore(now)) {
                overdue++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalProjects", (long) projectList.size());
        summary.put("activeProjects", active);
        summary.put("inactiveProjects", inactive);
        summary.put("overdueProjects", overdue);

        return summary;
    }
}
