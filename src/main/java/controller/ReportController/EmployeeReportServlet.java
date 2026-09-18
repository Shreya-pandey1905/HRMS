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

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, employeeList);
                return;
            }

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

    private void exportPdf(HttpServletResponse response, List<EmployeeReport> employeeList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=employee-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Employee Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(7);
        table.setWidthPercentage(100);

        table.addCell("Emp Id");
        table.addCell("Name");
        table.addCell("Email");
        table.addCell("Department");
        table.addCell("Phone");
        table.addCell("Joining Date");
        table.addCell("Status");

        for (EmployeeReport employee : employeeList) {

            table.addCell(String.valueOf(employee.getUserId()));
            table.addCell(employee.getEmployeeName());
            table.addCell(employee.getEmail());
            table.addCell(employee.getDepartmentName() != null ? employee.getDepartmentName() : "");
            table.addCell(employee.getPhoneNumber());
            table.addCell(employee.getDateOfJoining() != null ? employee.getDateOfJoining().toLocalDate().toString() : "");
            table.addCell(employee.getStatus());
        }

        document.add(table);
        document.close();
    }
}
