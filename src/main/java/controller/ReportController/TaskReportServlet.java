package controller.ReportController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Reports.TaskReport;
import service.Reports.TaskReportService;
import serviceImplementer.Reports.TaskReportServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/task-report")
public class TaskReportServlet extends HttpServlet {

    private TaskReportService taskReportService;

    @Override
    public void init() {
        taskReportService = new TaskReportServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<TaskReport> taskList = taskReportService.getTaskReport();

            if ("pdf".equalsIgnoreCase(request.getParameter("export"))) {
                exportPdf(response, taskList);
                return;
            }

            Map<String, Long> summary = taskReportService.getStatusSummary(taskList);

            request.setAttribute("taskList", taskList);
            request.setAttribute("summary", summary);

            request.getRequestDispatcher("/WEB-INF/views/Admin/taskReport.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException("Unable to load task report", e);
        }
    }

    private void exportPdf(HttpServletResponse response, List<TaskReport> taskList)
            throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=task-report.pdf");

        com.lowagie.text.Document document =
                new com.lowagie.text.Document(com.lowagie.text.PageSize.A4.rotate());

        com.lowagie.text.pdf.PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(com.lowagie.text.Font.HELVETICA, 18, com.lowagie.text.Font.BOLD);

        com.lowagie.text.Paragraph title = new com.lowagie.text.Paragraph("Task Report", titleFont);
        title.setAlignment(com.lowagie.text.Element.ALIGN_CENTER);

        document.add(title);
        document.add(new com.lowagie.text.Paragraph(" "));

        com.lowagie.text.pdf.PdfPTable table = new com.lowagie.text.pdf.PdfPTable(6);
        table.setWidthPercentage(100);

        table.addCell("Id");
        table.addCell("Task Name");
        table.addCell("Project Name");
        table.addCell("Due Date");
        table.addCell("Priority");
        table.addCell("Status");

        for (TaskReport task : taskList) {

            table.addCell(String.valueOf(task.getTaskId()));
            table.addCell(task.getTaskName());
            table.addCell(task.getProjectName());
            table.addCell(task.getDeadline() != null ? task.getDeadline().toLocalDate().toString() : "");
            table.addCell(task.getPriority());
            table.addCell(task.getStatus());
        }

        document.add(table);
        document.close();
    }
}
