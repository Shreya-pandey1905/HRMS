package serviceImplementer.Reports;

import dao.Reports.TaskReportDao;
import models.Reports.TaskReport;
import service.Reports.TaskReportService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class TaskReportServiceImpl implements TaskReportService {

    private TaskReportDao taskReportDao = new TaskReportDao();

    @Override
    public List<TaskReport> getTaskReport() {
        return taskReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<TaskReport> taskList) {

        long completed = 0;
        long inprogress = 0;
        long pending = 0;
        long onhold = 0;

        for (TaskReport task : taskList) {

            String status = task.getStatus();

            if ("Completed".equalsIgnoreCase(status)) {
                completed++;
            } else if ("Inprogress".equalsIgnoreCase(status)) {
                inprogress++;
            } else if ("Pending".equalsIgnoreCase(status)) {
                pending++;
            } else if ("Onhold".equalsIgnoreCase(status)) {
                onhold++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalTasks", (long) taskList.size());
        summary.put("completedTasks", completed);
        summary.put("inprogressTasks", inprogress);
        summary.put("pendingTasks", pending);
        summary.put("onholdTasks", onhold);

        return summary;
    }
}
