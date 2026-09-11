package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.AttendanceReport;
import service.Reports.AttendanceReportService;
import serviceImplementer.Reports.AttendanceReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/attendance-report")
public class AttendanceReportServlet extends HttpServlet {

    private AttendanceReportService attendanceReportService;

    @Override
    public void init() {
        attendanceReportService = new AttendanceReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<AttendanceReport> attendanceList = attendanceReportService.getAttendanceReport();
            Map<String, Long> summary = attendanceReportService.getStatusSummary(attendanceList);
            Map<String, long[]> chartData = attendanceReportService.getMonthlyChartData(attendanceList);

            request.setAttribute("attendanceList", attendanceList);
            request.setAttribute("summary", summary);
            request.setAttribute("chartData", chartData);

            request.getRequestDispatcher("/WEB-INF/views/Admin/attendanceReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load attendance report", e);
        }
    }
}
