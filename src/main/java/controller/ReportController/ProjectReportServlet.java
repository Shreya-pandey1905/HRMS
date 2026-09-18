package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.ProjectReport;
import service.Reports.ProjectReportService;
import serviceImplementer.Reports.ProjectReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/project-report")
public class ProjectReportServlet extends HttpServlet {

    private ProjectReportService projectReportService;

    @Override
    public void init() {
        projectReportService = new ProjectReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<ProjectReport> projectList = projectReportService.getProjectReport();

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, projectList);
                return;
            }

            Map<String, Long> summary = projectReportService.getStatusSummary(projectList);

            request.setAttribute("projectList", projectList);
            request.setAttribute("summary", summary);

            request.getRequestDispatcher("/WEB-INF/views/Admin/projectReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load project report", e);
        }
    }

    private void exportPdf(HttpServletResponse response, List<ProjectReport> projectList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=project-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Project Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(7);
        table.setWidthPercentage(100);

        table.addCell("Id");
        table.addCell("Project Name");
        table.addCell("Client");
        table.addCell("Manager");
        table.addCell("End Date");
        table.addCell("Priority");
        table.addCell("Status");

        for (ProjectReport project : projectList) {

            table.addCell(String.valueOf(project.getProjectId()));
            table.addCell(project.getProjectName());
            table.addCell(project.getClientName());
            table.addCell(project.getManagerName());
            table.addCell(project.getEndDate() != null ? project.getEndDate().toLocalDate().toString() : "");
            table.addCell(project.getPriority());
            table.addCell(project.getStatus());
        }

        document.add(table);
        document.close();
    }
}
