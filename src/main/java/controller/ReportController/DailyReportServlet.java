package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.DailyReport;
import service.Reports.DailyReportService;
import serviceImplementer.Reports.DailyReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/daily-report")
public class DailyReportServlet extends HttpServlet {

    private DailyReportService dailyReportService;

    @Override
    public void init() {
        dailyReportService = new DailyReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<DailyReport> dailyList = dailyReportService.getDailyReport();

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, dailyList);
                return;
            }

            Map<String, Long> summary = dailyReportService.getStatusSummary(dailyList);

            request.setAttribute("dailyList", dailyList);
            request.setAttribute("summary", summary);

            request.getRequestDispatcher("/WEB-INF/views/Admin/dailyReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load daily report", e);
        }
    }

    private void exportPdf(HttpServletResponse response, List<DailyReport> dailyList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=daily-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Daily Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(4);
        table.setWidthPercentage(100);

        table.addCell("Employee");
        table.addCell("Date");
        table.addCell("Department");
        table.addCell("Status");

        for (DailyReport daily : dailyList) {

            table.addCell(daily.getEmployeeName());
            table.addCell(daily.getDate() != null ? daily.getDate().toLocalDate().toString() : "");
            table.addCell(daily.getDepartmentName());
            table.addCell(daily.getStatus());
        }

        document.add(table);
        document.close();
    }
}
