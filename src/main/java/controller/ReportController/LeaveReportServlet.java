package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.LeaveReport;
import service.Reports.LeaveReportService;
import serviceImplementer.Reports.LeaveReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/leave-report")
public class LeaveReportServlet extends HttpServlet {

    private LeaveReportService leaveReportService;

    @Override
    public void init() {
        leaveReportService = new LeaveReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<LeaveReport> leaveList = leaveReportService.getLeaveReport();
            Map<String, Long> summary = leaveReportService.getStatusSummary(leaveList);
            Map<String, Long> chartData = leaveReportService.getLeaveTypeChartData(leaveList);

            request.setAttribute("leaveList", leaveList);
            request.setAttribute("summary", summary);
            request.setAttribute("chartData", chartData);

            request.getRequestDispatcher("/WEB-INF/views/Admin/leaveReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load leave report", e);
        }
    }
}
