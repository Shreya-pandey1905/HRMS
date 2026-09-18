package controller.DashboardController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Employees.User;
import models.Projects.AllProjects;
import models.Projects.Task;

import service.Projects.ProjectService;
import service.Projects.UserService;
import service.Projects.TaskService;

import serviceImplementer.Projects.ProjectServiceImpl;
import serviceImplementer.Projects.UserServiceImpl;
import serviceImplementer.Projects.TaskServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@MultipartConfig
@WebServlet("/ManagerDashboardServlet")
public class ManagerDashboardServlet extends HttpServlet {

    private final ProjectService projectService =
            new ProjectServiceImpl();

    private final UserService userService =
            new UserServiceImpl();

    private final TaskService taskService =
            new TaskServiceImpl();




    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("Manager Dashboard Servlet");


        HttpSession session = req.getSession(false);

        if (session == null) {

            System.out.println("Manager session is null");

            resp.sendRedirect(
                    req.getContextPath() + "/index.jsp"
            );

            return;
        }



        String roleName =
                (String) session.getAttribute("roleName");

        if (roleName == null ||
                !roleName.equalsIgnoreCase("Manager")) {

            System.out.println(
                    "Invalid role for Manager Dashboard"
            );

            resp.sendRedirect(
                    req.getContextPath() + "/index.jsp"
            );

            return;
        }




        String action =
                req.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "dashboard";
        }




        try {

            switch (action) {

                case "dashboard":

                    showDashboard(req, resp);

                    break;


                case "projectDetails":

                    projectDetails(req, resp);

                    break;

                case "taskDetails":

                    taskDetails(req, resp);

                    break;

                case "addTask":

                    addTaskPage(req, resp);

                    break;

                case "projectEmployees":

                    getProjectEmployees(req, resp);

                    break;


                case "addProject":

                    addProjectPage(req, resp);

                    break;


                case "editProject":

                    editProjectPage(req, resp);

                    break;


                case "deleteProject":

                    deleteProject(req, resp);

                    break;


                case "exportProjects":

                    exportProjects(req, resp);

                    break;


                default:

                    showDashboard(req, resp);

                    break;
            }

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }




    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        // ==============================
        // SESSION CHECK
        // ==============================

        HttpSession session =
                req.getSession(false);

        if (session == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/index.jsp"
            );

            return;
        }



        String roleName =
                (String) session.getAttribute("roleName");

        if (roleName == null ||
                !roleName.equalsIgnoreCase("Manager")) {

            resp.sendRedirect(
                    req.getContextPath() + "/index.jsp"
            );

            return;
        }




        String action =
                req.getParameter("action");

        if (action == null || action.isEmpty()) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Action is required"
            );

            return;
        }




        try {

            switch (action) {

                case "addProject":

                    addProject(req, resp);

                    break;

                case "addTask":

                    addTask(req, resp);

                    break;


                case "updateProject":

                    updateProject(req, resp);

                    break;


                default:

                    resp.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid action"
                    );

                    break;
            }

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }



    private void showDashboard(HttpServletRequest req,
                               HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/dashboard.jsp"
        ).forward(req, resp);
    }




    private void projectDetails(HttpServletRequest req,
                                HttpServletResponse resp) throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/LoginServlet");
            return;
        }

        // Logged-in Manager's UserId
        int managerId = (int) session.getAttribute("userId");

        // Pagination
        int page = 1;

        String pageParam = req.getParameter("page");

        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
                if (page < 1) {
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        int pageSize = 5;

        // Sorting
        String sort = req.getParameter("sort");

        if (!"asc".equalsIgnoreCase(sort)) {
            sort = "desc";
        }

        // Count ONLY this Manager's projects
        int totalProjects =
                projectService.getProjectCountByManager(managerId);

        int totalPages =
                (int) Math.ceil((double) totalProjects / pageSize);

        // Get ONLY this Manager's projects
        List<AllProjects> projects =
                projectService.getProjectsByManager(
                        managerId,
                        page,
                        pageSize,
                        sort
                );

        req.setAttribute("projects", projects);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("sort", sort);

        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/project.jsp"
        ).forward(req, resp);
    }




    private void addProjectPage(HttpServletRequest req,
                                HttpServletResponse resp)
            throws Exception {

        List<User> managers =
                userService.getProjectManagers();

        List<User> employees =
                userService.getProjectEmployees();


        req.setAttribute(
                "managers",
                managers
        );

        req.setAttribute(
                "employees",
                employees
        );


        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/addProject.jsp"
        ).forward(req, resp);
    }




    private void addProject(HttpServletRequest req,
                            HttpServletResponse resp)
            throws Exception {


        String projectName =
                req.getParameter("projectName");

        String clientName =
                req.getParameter("clientName");

        String description =
                req.getParameter("description");

        String startDate =
                req.getParameter("startDate");

        String endDate =
                req.getParameter("endDate");

        String priority =
                req.getParameter("priority");

        String projectValue =
                req.getParameter("projectValue");

        String priceType =
                req.getParameter("priceType");

        String status =
                req.getParameter("status");

        String managerName =
                req.getParameter("managerName");


        try {



            AllProjects project =
                    new AllProjects();

            project.setProjectName(projectName);

            project.setClientName(clientName);

            project.setDescription(description);




            LocalDateTime startDateTime =
                    LocalDate.parse(startDate)
                            .atStartOfDay();

            LocalDateTime endDateTime =
                    LocalDate.parse(endDate)
                            .atStartOfDay();

            project.setStartDate(
                    startDateTime
            );

            project.setEndDate(
                    endDateTime
            );



            project.setPriority(priority);

            project.setPriceType(priceType);

            project.setStatus(status);

            project.setManagerName(managerName);




            if (projectValue != null &&
                    !projectValue.trim().isEmpty()) {

                project.setProjectValue(
                        Double.parseDouble(projectValue)
                );

            } else {

                project.setProjectValue(0);
            }




            project.setFilePath("");

            project.setLogoPath("");



            int projectId =
                    projectService.addProject(project);


            String[] teamMembers =
                    req.getParameterValues(
                            "teamMembers"
                    );


            System.out.println(
                    "Selected team members = "
                            + java.util.Arrays.toString(
                            teamMembers
                    )
            );


            if (teamMembers != null) {

                for (String teamMember :
                        teamMembers) {

                    int userId =
                            Integer.parseInt(
                                    teamMember
                            );

                    userService.addProjectEmployee(
                            projectId,
                            userId
                    );
                }
            }



            System.out.println(
                    "Project created successfully. ID = "
                            + projectId
            );


            HttpSession session =
                    req.getSession(false);


            session.setAttribute(
                    "successMessage",
                    "Project Added Successfully!!!"
            );


            resp.sendRedirect(
                    req.getContextPath()
                            + "/ManagerDashboardServlet"
                            + "?action=projectDetails"
            );


        } catch (Exception e) {

            e.printStackTrace();

            String errorMessage =
                    e.getMessage();


            System.out.println(
                    "ERROR MESSAGE = "
                            + errorMessage
            );


            if (errorMessage != null &&
                    errorMessage.contains(
                            "Project name already exists"
                    )) {

                req.setAttribute(
                        "projectNameError",
                        "Project name already exists"
                );


            } else if (errorMessage != null &&
                    errorMessage.contains(
                            "End date cannot be before start date"
                    )) {

                req.setAttribute(
                        "dateError",
                        "End date cannot be before start date"
                );


            } else {

                req.setAttribute(
                        "generalError",
                        errorMessage
                );
            }



            req.setAttribute(
                    "projectName",
                    projectName
            );

            req.setAttribute(
                    "clientName",
                    clientName
            );

            req.setAttribute(
                    "description",
                    description
            );

            req.setAttribute(
                    "startDate",
                    startDate
            );

            req.setAttribute(
                    "endDate",
                    endDate
            );

            req.setAttribute(
                    "priority",
                    priority
            );

            req.setAttribute(
                    "projectValue",
                    projectValue
            );

            req.setAttribute(
                    "priceType",
                    priceType
            );

            req.setAttribute(
                    "status",
                    status
            );

            req.setAttribute(
                    "managerName",
                    managerName
            );



            List<User> managers =
                    userService.getProjectManagers();

            List<User> employees =
                    userService.getProjectEmployees();


            req.setAttribute(
                    "managers",
                    managers
            );

            req.setAttribute(
                    "employees",
                    employees
            );


            req.getRequestDispatcher(
                    "/WEB-INF/views/Manager/addProject.jsp"
            ).forward(req, resp);
        }
    }




    private void deleteProject(HttpServletRequest req,
                               HttpServletResponse resp)
            throws Exception {

        String projectIdParam =
                req.getParameter("projectId");


        if (projectIdParam == null ||
                projectIdParam.trim().isEmpty()) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Project ID is required"
            );

            return;
        }


        int projectId =
                Integer.parseInt(projectIdParam);


        projectService.deleteProject(
                projectId
        );


        HttpSession session =
                req.getSession(false);


        session.setAttribute(
                "successMessage",
                "Project deleted successfully!"
        );


        resp.sendRedirect(
                req.getContextPath()
                        + "/ManagerDashboardServlet"
                        + "?action=projectDetails"
        );
    }



    private void editProjectPage(HttpServletRequest req,
                                 HttpServletResponse resp)
            throws Exception {

        String projectIdParam =
                req.getParameter("projectId");


        if (projectIdParam == null ||
                projectIdParam.trim().isEmpty()) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Project ID is required"
            );

            return;
        }


        int projectId =
                Integer.parseInt(projectIdParam);


        AllProjects project =
                projectService.getProjectById(
                        projectId
                );


        if (project == null) {

            resp.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Project not found"
            );

            return;
        }


        List<User> managers =
                userService.getProjectManagers();

        List<User> employees =
                userService.getProjectEmployees();


        req.setAttribute(
                "project",
                project
        );

        req.setAttribute(
                "managers",
                managers
        );

        req.setAttribute(
                "employees",
                employees
        );


        req.setAttribute(
                "editMode",
                true
        );


        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/addProject.jsp"
        ).forward(req, resp);
    }



    private void updateProject(HttpServletRequest req,
                               HttpServletResponse resp)
            throws Exception {

        String projectIdParam =
                req.getParameter("projectId");

        String projectName =
                req.getParameter("projectName");

        String clientName =
                req.getParameter("clientName");

        String description =
                req.getParameter("description");

        String startDate =
                req.getParameter("startDate");

        String endDate =
                req.getParameter("endDate");

        String priority =
                req.getParameter("priority");

        String projectValue =
                req.getParameter("projectValue");

        String priceType =
                req.getParameter("priceType");

        String status =
                req.getParameter("status");

        String managerName =
                req.getParameter("managerName");


        try {

            int projectId =
                    Integer.parseInt(
                            projectIdParam
                    );




            if (projectService.projectNameExistsForEdit(
                    projectName.trim(),
                    projectId
            )) {

                throw new Exception(
                        "Project name already exists"
                );
            }



            AllProjects project =
                    new AllProjects();


            project.setProjectId(
                    projectId
            );

            project.setProjectName(
                    projectName
            );

            project.setClientName(
                    clientName
            );

            project.setDescription(
                    description
            );


            LocalDateTime startDateTime =
                    LocalDate.parse(startDate)
                            .atStartOfDay();

            LocalDateTime endDateTime =
                    LocalDate.parse(endDate)
                            .atStartOfDay();


            project.setStartDate(
                    startDateTime
            );

            project.setEndDate(
                    endDateTime
            );




            project.setPriority(
                    priority
            );


            if (projectValue != null &&
                    !projectValue.trim().isEmpty()) {

                project.setProjectValue(
                        Double.parseDouble(
                                projectValue
                        )
                );

            } else {

                project.setProjectValue(0);
            }


            project.setPriceType(
                    priceType
            );

            project.setStatus(
                    status
            );

            project.setManagerName(
                    managerName
            );


            projectService.updateProject(
                    project
            );



            String[] teamMembers =
                    req.getParameterValues(
                            "teamMembers"
                    );


            userService.updateProjectEmployees(
                    projectId,
                    teamMembers
            );



            HttpSession session =
                    req.getSession(false);


            session.setAttribute(
                    "successMessage",
                    "Project updated successfully!"
            );




            resp.sendRedirect(
                    req.getContextPath()
                            + "/ManagerDashboardServlet"
                            + "?action=projectDetails"
            );


        } catch (Exception e) {

            e.printStackTrace();

            String errorMessage =
                    e.getMessage();


            if (errorMessage != null &&
                    errorMessage.contains(
                            "Project name already exists"
                    )) {

                req.setAttribute(
                        "projectNameError",
                        "Project name already exists"
                );


            } else if (errorMessage != null &&
                    errorMessage.contains(
                            "End date cannot be before start date"
                    )) {

                req.setAttribute(
                        "dateError",
                        "End date cannot be before start date"
                );


            } else {

                req.setAttribute(
                        "generalError",
                        errorMessage
                );
            }


            req.setAttribute(
                    "projectName",
                    projectName
            );

            req.setAttribute(
                    "clientName",
                    clientName
            );

            req.setAttribute(
                    "description",
                    description
            );

            req.setAttribute(
                    "startDate",
                    startDate
            );

            req.setAttribute(
                    "endDate",
                    endDate
            );

            req.setAttribute(
                    "priority",
                    priority
            );

            req.setAttribute(
                    "projectValue",
                    projectValue
            );

            req.setAttribute(
                    "priceType",
                    priceType
            );

            req.setAttribute(
                    "status",
                    status
            );

            req.setAttribute(
                    "managerName",
                    managerName
            );




            List<User> managers =
                    userService.getProjectManagers();

            List<User> employees =
                    userService.getProjectEmployees();


            req.setAttribute(
                    "managers",
                    managers
            );

            req.setAttribute(
                    "employees",
                    employees
            );


            req.setAttribute(
                    "editMode",
                    true
            );




            AllProjects project =
                    projectService.getProjectById(
                            Integer.parseInt(
                                    projectIdParam
                            )
                    );


            req.setAttribute(
                    "project",
                    project
            );


            req.getRequestDispatcher(
                    "/WEB-INF/views/Manager/addProject.jsp"
            ).forward(req, resp);
        }
    }




    private void taskDetails(HttpServletRequest req,
                             HttpServletResponse resp)
            throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/LoginServlet"
            );

            return;
        }

        // Logged-in Manager's UserId
        int managerId =
                (int) session.getAttribute("userId");


        // Priority filter
        String priority =
                req.getParameter("priority");

        if (priority == null ||
                priority.trim().isEmpty()) {

            priority = "All";
        }


        // Manager's projects only
        List<AllProjects> projects =
                projectService.getTaskProjectsByManager(
                        managerId,
                        priority
                );


        // Manager's tasks only
        List<Task> tasks =
                taskService.getTasksByManager(
                        managerId,
                        priority
                );


        req.setAttribute(
                "taskProjects",
                projects
        );

        req.setAttribute(
                "tasks",
                tasks
        );

        req.setAttribute(
                "selectedPriority",
                priority
        );


        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/tasks.jsp"
        ).forward(req, resp);
    }




    private void addTaskPage(HttpServletRequest req,
                             HttpServletResponse resp)
            throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/LoginServlet"
            );

            return;
        }

        int managerId =
                (int) session.getAttribute("userId");

        // Get ONLY this Manager's active projects
        List<AllProjects> activeProjects =
                projectService.getActiveProjectsByManager(
                        managerId
                );

        req.setAttribute(
                "activeProjects",
                activeProjects
        );

        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/addTask.jsp"
        ).forward(req, resp);
    }




    private void getProjectEmployees(HttpServletRequest req,
                                     HttpServletResponse resp)
            throws Exception {

        String projectIdParam = req.getParameter("projectId");

        if (projectIdParam == null ||
                projectIdParam.trim().isEmpty()) {

            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Project ID is required"
            );

            return;
        }

        int projectId = Integer.parseInt(projectIdParam);

        List<User> employees =
                userService.getProjectEmployeesByProject(projectId);

        resp.setContentType("text/html;charset=UTF-8");

        StringBuilder html = new StringBuilder();

        for (User employee : employees) {

            html.append("<option value=\"")
                    .append(employee.getUserId())
                    .append("\">")
                    .append(employee.getFirstName())
                    .append(" ")
                    .append(employee.getLastName())
                    .append("</option>");
        }

        resp.getWriter().write(html.toString());
    }



    private void addTask(HttpServletRequest req,
                         HttpServletResponse resp)
            throws Exception {

        String title = req.getParameter("title");
        String deadline = req.getParameter("deadline");
        String projectIdParam = req.getParameter("projectId");
        String teamMemberParam = req.getParameter("teamMembers");
        String status = req.getParameter("status");
        String priority = req.getParameter("priority");
        String description = req.getParameter("description");

        try {

            int projectId = Integer.parseInt(projectIdParam);
            int userId = Integer.parseInt(teamMemberParam);

            LocalDate dueDate = LocalDate.parse(deadline);

            // Due date cannot be before today
            if (dueDate.isBefore(LocalDate.now())) {

                req.setAttribute(
                        "errorMessage",
                        "Due date cannot be before today."
                );

                loadAddTaskPage(req, resp);
                return;
            }

            Task task = new Task();

            task.setProjectId(projectId);
            task.setTitle(title);
            task.setDescription(description);
            task.setStatus(status);
            task.setPriority(priority);
            task.setFilePath("");
            task.setDeadline(dueDate.atStartOfDay());

            taskService.addTask(task, userId);

            // SUCCESS
            HttpSession session = req.getSession(false);

            session.setAttribute(
                    "successMessage",
                    "Task added successfully!"
            );

            resp.sendRedirect(
                    req.getContextPath()
                            + "/ManagerDashboardServlet?action=taskDetails"
            );

        } catch (Exception e) {

            e.printStackTrace();

            req.setAttribute(
                    "errorMessage",
                    e.getMessage()
            );

            loadAddTaskPage(req, resp);
        }
    }



    private void loadAddTaskPage(HttpServletRequest req,
                                 HttpServletResponse resp)
            throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/LoginServlet"
            );

            return;
        }

        int managerId =
                (int) session.getAttribute("userId");

        // Get ONLY this Manager's active projects
        List<AllProjects> activeProjects =
                projectService.getActiveProjectsByManager(
                        managerId
                );

        req.setAttribute(
                "activeProjects",
                activeProjects
        );

        req.getRequestDispatcher(
                "/WEB-INF/views/Manager/addTask.jsp"
        ).forward(req, resp);
    }



    private void exportProjects(HttpServletRequest req,
                                HttpServletResponse resp)
            throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/LoginServlet");
            return;
        }

        int managerId = (int) session.getAttribute("userId");


        String sort =
                req.getParameter("sort");

        if (!"asc".equalsIgnoreCase(sort)) {
            sort = "desc";
        }


        // Get ONLY this Manager's projects
        List<AllProjects> projects =
                projectService.getProjectsByManagerForExport(
                        managerId,
                        sort
                );


        resp.setContentType(
                "application/pdf"
        );

        resp.setHeader(
                "Content-Disposition",
                "attachment; filename=projects.pdf"
        );


        com.lowagie.text.Document document =
                new com.lowagie.text.Document(
                        com.lowagie.text.PageSize.A4.rotate()
                );


        com.lowagie.text.pdf.PdfWriter.getInstance(
                document,
                resp.getOutputStream()
        );


        document.open();


        com.lowagie.text.Font titleFont =
                new com.lowagie.text.Font(
                        com.lowagie.text.Font.HELVETICA,
                        18,
                        com.lowagie.text.Font.BOLD
                );


        com.lowagie.text.Paragraph title =
                new com.lowagie.text.Paragraph(
                        "Project List",
                        titleFont
                );


        title.setAlignment(
                com.lowagie.text.Element.ALIGN_CENTER
        );


        document.add(title);

        document.add(
                new com.lowagie.text.Paragraph(" ")
        );


        com.lowagie.text.pdf.PdfPTable table =
                new com.lowagie.text.pdf.PdfPTable(7);

        table.setWidthPercentage(100);


        table.addCell("ID");
        table.addCell("Project Name");
        table.addCell("Client");
        table.addCell("End Date");
        table.addCell("Priority");
        table.addCell("Status");
        table.addCell("Team Members");


        for (AllProjects project : projects) {

            table.addCell(
                    String.valueOf(
                            project.getProjectId()
                    )
            );

            table.addCell(
                    project.getProjectName()
            );

            table.addCell(
                    project.getClientName()
            );


            String endDate = "";

            if (project.getEndDate() != null) {

                endDate =
                        project.getEndDate()
                                .toLocalDate()
                                .toString();
            }

            table.addCell(endDate);

            table.addCell(
                    project.getPriority()
            );

            table.addCell(
                    project.getStatus()
            );


            String teamMembers =
                    project.getTeamMembers();

            if (teamMembers == null ||
                    teamMembers.trim().isEmpty()) {

                teamMembers = "-";
            }

            table.addCell(
                    teamMembers
            );
        }


        document.add(table);

        document.close();
    }
}