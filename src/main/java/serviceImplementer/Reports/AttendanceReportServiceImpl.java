package serviceImplementer.Reports;

import dao.Reports.AttendanceReportDao;
import models.Reports.AttendanceReport;
import service.Reports.AttendanceReportService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class AttendanceReportServiceImpl implements AttendanceReportService {

    private AttendanceReportDao attendanceReportDao = new AttendanceReportDao();

    @Override
    public List<AttendanceReport> getAttendanceReport() {
        return attendanceReportDao.getAll();
    }

    @Override
    public Map<String, Long> getStatusSummary(List<AttendanceReport> attendanceList) {

        long present = 0;
        long absent = 0;
        long halfDay = 0;

        for (AttendanceReport attendance : attendanceList) {

            String status = attendance.getStatus();

            if ("Present".equalsIgnoreCase(status)) {
                present++;
            } else if ("Absent".equalsIgnoreCase(status)) {
                absent++;
            } else if ("Half Day".equalsIgnoreCase(status)) {
                halfDay++;
            }
        }

        Map<String, Long> summary = new LinkedHashMap<>();
        summary.put("totalDays", (long) attendanceList.size());
        summary.put("totalPresent", present);
        summary.put("totalAbsent", absent);
        summary.put("totalHalfDay", halfDay);

        return summary;
    }

    @Override
    public Map<String, long[]> getMonthlyChartData(List<AttendanceReport> attendanceList) {

        // key = "yyyy-MM", value = [presentCount, absentCount]
        Map<String, long[]> chartData = new TreeMap<>();

        for (AttendanceReport attendance : attendanceList) {

            if (attendance.getDate() == null) {
                continue;
            }

            String month = attendance.getDate().getYear()
                    + "-"
                    + String.format("%02d", attendance.getDate().getMonthValue());

            chartData.putIfAbsent(month, new long[2]);

            long[] counts = chartData.get(month);

            if ("Present".equalsIgnoreCase(attendance.getStatus())) {
                counts[0]++;
            } else if ("Absent".equalsIgnoreCase(attendance.getStatus())) {
                counts[1]++;
            }
        }

        return chartData;
    }
}
