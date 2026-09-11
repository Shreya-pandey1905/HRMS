package controller.EmployeeController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Employees.EmployeeDetails;
import models.Employees.User;
import service.Employee.EmployeeDetailsService;
import service.Employee.EmployeeService;
import serviceImplementer.Employee.EmployeeDetailsServiceImpl;
import serviceImplementer.Employee.EmployeeServiceImpl;
import util.PasswordUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/admin/employees")
@MultipartConfig
public class EmployeeServlet extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();
    private final EmployeeDetailsService employeeDetailsService =
            new EmployeeDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {

            List<User> employees = employeeService.getAllEmployees();
            request.setAttribute("employees", employees);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/views/Admin/employees.jsp");

            dispatcher.forward(request, response);

        }  else if (action.equals("add")) {

        List<User> managers = employeeService.getManagers();
        List<User> roles = employeeService.getRoles();
        List<User> departments = employeeService.getDepartments();
        List<User> designations = employeeService.getDesignations();

        request.setAttribute("managers", managers);
        request.setAttribute("roles", roles);
        request.setAttribute("departments", departments);
        request.setAttribute("designations", designations);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/Admin/add-employee.jsp");

        dispatcher.forward(request, response);
    } else if ("edit".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));

            User employee = employeeService.getEmployeeById(id);

            List<User> managers = employeeService.getManagers();
            List<User> roles = employeeService.getRoles();
            List<User> departments = employeeService.getDepartments();
            List<User> designations = employeeService.getDesignations();

            request.setAttribute("employee", employee);
            request.setAttribute("managers", managers);
            request.setAttribute("roles", roles);
            request.setAttribute("departments", departments);
            request.setAttribute("designations", designations);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/WEB-INF/views/Admin/edit-employee.jsp"
                    );

            dispatcher.forward(request, response);
        } else if ("view".equals(action)) {

        int id = Integer.parseInt(request.getParameter("id"));

        EmployeeDetails employeeDetails =
                employeeDetailsService.getEmployeeDetails(id);

        request.setAttribute("employeeDetails", employeeDetails);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/employee-details.jsp"
                );

        dispatcher.forward(request, response);

    } else if (action.equals("delete")) {

            int id = Integer.parseInt(request.getParameter("id"));

            if (employeeService.deleteEmployee(id)) {

                response.sendRedirect(
                        request.getContextPath() + "/admin/employees?action=list"
                );

            } else {

                response.sendError(
                        HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Unable to delete employee"
                );
            }
        }
        else if (action.equals("grid")) {

            List<User> employees = employeeService.getAllEmployees();

            request.setAttribute("employees", employees);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/WEB-INF/views/Admin/employee-grid.jsp"
                    );

            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        System.out.println("ACTION = " + action);
        System.out.println("REQUEST URI = " + request.getRequestURI());

        if ("add".equals(action)) {

            User user = createUser(request);

            user.setCreatedBy("admin");
            user.setStatus("Active");

            if (employeeService.addEmployee(user)) {

                response.sendRedirect(
                        request.getContextPath() + "/admin/employees?action=list"
                );

            } else {

                request.setAttribute("error", "Email already exists");

                List<User> managers = employeeService.getManagers();
                List<User> roles = employeeService.getRoles();
                List<User> departments = employeeService.getDepartments();
                List<User> designations = employeeService.getDesignations();

                request.setAttribute("managers", managers);
                request.setAttribute("roles", roles);
                request.setAttribute("departments", departments);
                request.setAttribute("designations", designations);

                RequestDispatcher dispatcher =
                        request.getRequestDispatcher(
                                "/WEB-INF/views/Admin/add-employee.jsp"
                        );

                dispatcher.forward(request, response);
            }

        } else if ("update".equals(action)) {

        int userId = Integer.parseInt(request.getParameter("userId"));

        User existingUser = employeeService.getEmployeeById(userId);

        User user = createUser(request);

        user.setUserId(userId);

        if (user.getPasswordHash() == null || user.getPasswordHash().isEmpty()) {
            user.setPasswordHash(existingUser.getPasswordHash());
        }

        if (user.getProfilePicture() == null || user.getProfilePicture().isEmpty()) {
            user.setProfilePicture(existingUser.getProfilePicture());
        }

        user.setModifiedBy("admin");
        user.setStatus(request.getParameter("status"));

        employeeService.updateEmployee(user);

        response.sendRedirect(
                request.getContextPath() + "/admin/employees?action=list"
        );
    }
    }
    private User createUser(HttpServletRequest request) throws ServletException, IOException {

        User user = new User();

        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        String password = request.getParameter("password");

        if (password != null && !password.isBlank()) {
            user.setPasswordHash(PasswordUtil.hash(password));
        }
        user.setPhoneNumber(request.getParameter("phoneNumber"));

        user.setRoleId(
                Integer.parseInt(request.getParameter("roleId"))
        );

        String departmentId = request.getParameter("departmentId");

        if (departmentId != null && !departmentId.isEmpty()) {
            user.setDepartmentId(
                    Integer.parseInt(departmentId)
            );
        }

        String designationId = request.getParameter("designationId");

        if (designationId != null && !designationId.isEmpty()) {
            user.setDesignationId(
                    Integer.parseInt(designationId)
            );
        }

        user.setDateOfJoining(
                LocalDateTime.parse(
                        request.getParameter("dateOfJoining") + "T00:00:00"
                )
        );

        user.setDateOfBirth(
                LocalDateTime.parse(
                        request.getParameter("dateOfBirth") + "T00:00:00"
                )
        );

        user.setGender(request.getParameter("gender"));
        user.setAddress(request.getParameter("address"));
        user.setAboutEmployee(request.getParameter("aboutEmployee"));
        Part profilePart = request.getPart("profilePicture");

        if (profilePart != null && profilePart.getSize() > 0) {

            String fileName = profilePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("/Content/uploads");

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            File file = new File(uploadDir, fileName);

            try (InputStream inputStream = profilePart.getInputStream()) {
                Files.copy(
                        inputStream,
                        file.toPath(),
                        java.nio.file.StandardCopyOption.REPLACE_EXISTING
                );
            }

            user.setProfilePicture("Content/uploads/" + fileName);

        } else {
            user.setProfilePicture("");
        }
        user.setReportingManager(request.getParameter("reportingManager"));

        return user;
    }
}