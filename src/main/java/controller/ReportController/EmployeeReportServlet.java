package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.EmployeeReport;
import service.Reports.EmployeeReportService;
import serviceImplementer.Reports.EmployeeReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/employee-report")
public class EmployeeReportServlet extends HttpServlet {

    private EmployeeReportService employeeReportService;

    @Override
    public void init() {
        employeeReportService = new EmployeeReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<EmployeeReport> employeeList = employeeReportService.getEmployeeReport();
            Map<String, Long> summary = employeeReportService.getStatusSummary(employeeList);
            Map<String, long[]> chartData = employeeReportService.getJoinMonthChartData(employeeList);

            request.setAttribute("employeeList", employeeList);
            request.setAttribute("summary", summary);
            request.setAttribute("chartData", chartData);

            request.getRequestDispatcher("/WEB-INF/views/Admin/employeeReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load employee report", e);
        }
    }
}
