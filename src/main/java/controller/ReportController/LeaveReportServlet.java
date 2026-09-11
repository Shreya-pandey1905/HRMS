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

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, leaveList);
                return;
            }

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

    private void exportPdf(HttpServletResponse response, List<LeaveReport> leaveList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=leave-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Leave Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(8);
        table.setWidthPercentage(100);

        table.addCell("Id");
        table.addCell("Employee");
        table.addCell("Leave Type");
        table.addCell("Start Date");
        table.addCell("End Date");
        table.addCell("Days");
        table.addCell("Approved By");
        table.addCell("Status");

        for (LeaveReport leave : leaveList) {

            table.addCell(String.valueOf(leave.getLeaveRequestId()));
            table.addCell(leave.getEmployeeName());
            table.addCell(leave.getLeaveType());
            table.addCell(leave.getStartDate() != null ? leave.getStartDate().toLocalDate().toString() : "");
            table.addCell(leave.getEndDate() != null ? leave.getEndDate().toLocalDate().toString() : "");
            table.addCell(String.valueOf(leave.getNumberOfDays()));
            table.addCell(leave.getApprovedBy());
            table.addCell(leave.getStatus());
        }

        document.add(table);
        document.close();
    }
}
