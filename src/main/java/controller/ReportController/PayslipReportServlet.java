package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.PayslipReport;
import service.Reports.PayslipReportService;
import serviceImplementer.Reports.PayslipReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/payslip-report")
public class PayslipReportServlet extends HttpServlet {

    private PayslipReportService payslipReportService;

    @Override
    public void init() {
        payslipReportService = new PayslipReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<PayslipReport> payslipList = payslipReportService.getPayslipReport();

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, payslipList);
                return;
            }

            Map<String, Double> summary = payslipReportService.getSummary(payslipList);

            request.setAttribute("payslipList", payslipList);
            request.setAttribute("summary", summary);

            request.getRequestDispatcher("/WEB-INF/views/Admin/payslipReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load payslip report", e);
        }
    }

    private void exportPdf(HttpServletResponse response, List<PayslipReport> payslipList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=payslip-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Payslip Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(5);
        table.setWidthPercentage(100);

        table.addCell("Id");
        table.addCell("Employee");
        table.addCell("Paid Amount");
        table.addCell("Paid Month");
        table.addCell("Paid Year");

        for (PayslipReport payslip : payslipList) {

            table.addCell(String.valueOf(payslip.getPayslipId()));
            table.addCell(payslip.getEmployeeName());
            table.addCell(String.valueOf(payslip.getPaidAmount()));
            table.addCell(payslip.getPaidMonth());
            table.addCell(String.valueOf(payslip.getPaidYear()));
        }

        document.add(table);
        document.close();
    }
}
