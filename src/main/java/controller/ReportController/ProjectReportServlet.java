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
}
