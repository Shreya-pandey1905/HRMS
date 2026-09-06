package controller.AuthController;

import dao.Role.RoleDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.AuthUser.Users;
import models.Employees.Role;
import service.Auth.LoginService;
import serviceImplementer.Auth.LoginServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginService loginService = new LoginServiceImpl();
    private RoleDao roleDao = new RoleDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Users user = loginService.login(email, password);

            Role role = roleDao.getRoleById(user.getRoleId());

            HttpSession session = request.getSession();

            session.setAttribute("userId", user.getUserId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("roleId", user.getRoleId());
            session.setAttribute("roleName", role.getRoleName());

            if (role == null) {
                throw new RuntimeException("Invalid user role");
            }
            String roleName = role.getRoleName();
            if ("Admin".equalsIgnoreCase(roleName)) {
                request.getRequestDispatcher("/WEB-INF/views/Admin/dashboard.jsp").forward(request, response);
            } else if ("Employee".equalsIgnoreCase(roleName)) {
                request.getRequestDispatcher("/WEB-INF/views/Employee/dashboard.jsp").forward(request, response);

            } else if ("Manager".equalsIgnoreCase(roleName)) {
                request.getRequestDispatcher("/WEB-INF/views/Manager/dashboard.jsp").forward(request, response);

            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid role");
            }

        } catch (RuntimeException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
