package serviceImplementer.Reports;

import dao.Reports.DailyReportDao;
import models.Reports.DailyReport;
import service.Reports.DailyReportService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DailyReportServiceImpl implements DailyReportService {

    private DailyReportDao dailyReportDao = new DailyReportDao();

    @Override
    public List<DailyReport> getDailyReport() {
        return dailyReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<DailyReport> dailyList) {

        long present = 0;
        long absent = 0;
        long halfDay = 0;

        for (DailyReport daily : dailyList) {

            String status = daily.getStatus();

            if ("Present".equalsIgnoreCase(status)) {
                present++;
            } else if ("Absent".equalsIgnoreCase(status)) {
                absent++;
            } else if ("Half Day".equalsIgnoreCase(status)) {
                halfDay++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalEmployees", (long) dailyList.size());
        summary.put("totalPresent", present);
        summary.put("totalAbsent", absent);
        summary.put("totalHalfDay", halfDay);

        return summary;
    }
}
