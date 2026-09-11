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

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, attendanceList);
                return;
            }

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

    private void exportPdf(HttpServletResponse response, List<AttendanceReport> attendanceList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=attendance-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Attendance Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(9);
        table.setWidthPercentage(100);

        table.addCell("Id");
        table.addCell("Employee");
        table.addCell("Date");
        table.addCell("Check In");
        table.addCell("Check Out");
        table.addCell("Working Hours");
        table.addCell("Overtime Hours");
        table.addCell("Late (min)");
        table.addCell("Status");

        for (AttendanceReport attendance : attendanceList) {

            table.addCell(String.valueOf(attendance.getAttendanceId()));
            table.addCell(attendance.getEmployeeName());
            table.addCell(attendance.getDate() != null ? attendance.getDate().toLocalDate().toString() : "");
            table.addCell(attendance.getCheckIn() != null ? attendance.getCheckIn().toLocalTime().toString() : "-");
            table.addCell(attendance.getCheckOut() != null ? attendance.getCheckOut().toLocalTime().toString() : "-");
            table.addCell(String.valueOf(attendance.getWorkingHours()));
            table.addCell(String.valueOf(attendance.getOvertimeHours()));
            table.addCell(String.valueOf(attendance.getLate()));
            table.addCell(attendance.getStatus());
        }

        document.add(table);
        document.close();
    }
}
