package serviceImplementer.Reports;

import dao.Reports.LeaveReportDao;
import models.Reports.LeaveReport;
import service.Reports.LeaveReportService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class LeaveReportServiceImpl implements LeaveReportService {

    private LeaveReportDao leaveReportDao = new LeaveReportDao();

    @Override
    public List<LeaveReport> getLeaveReport() {
        return leaveReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<LeaveReport> leaveList) {

        long approved = 0;
        long pending = 0;
        long rejected = 0;

        for (LeaveReport leave : leaveList) {

            String status = leave.getStatus();

            if ("Approved".equalsIgnoreCase(status)) {
                approved++;
            } else if ("Pending".equalsIgnoreCase(status)) {
                pending++;
            } else if ("Rejected".equalsIgnoreCase(status)) {
                rejected++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalLeaves", (long) leaveList.size());
        summary.put("approvedLeaves", approved);
        summary.put("pendingLeaves", pending);
        summary.put("rejectedLeaves", rejected);

        return summary;
    }

    @Override
    public Map<String, Long> getLeaveTypeChartData(List<LeaveReport> leaveList) {

        // key = leave type name, value = how many requests of that type
        Map<String, Long> chartData = new TreeMap<>();

        for (LeaveReport leave : leaveList) {

            String leaveType = leave.getLeaveType();

            if (leaveType == null) {
                continue;
            }

            chartData.put(leaveType, chartData.getOrDefault(leaveType, 0L) + 1);
        }

        return chartData;
    }
}
