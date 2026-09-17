package controller.RoleController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Employees.Role;
import service.Role.RoleService;
import serviceImplementer.Role.RoleServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/roles")
public class RoleServlet extends HttpServlet {

    private RoleService roleService;

    @Override
    public void init() throws ServletException {

        roleService = new RoleServiceImpl();
    }


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Role> roles = roleService.getAllRoles();

        request.setAttribute("roles", roles);

        request.getRequestDispatcher(
                "/WEB-INF/views/Admin/roles.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        if (action == null || action.isEmpty()) {

            addRole(request, response, session);

            return;
        }


        switch (action) {

            case "update":

                updateRole(request, response, session);

                break;


            case "delete":

                deleteRole(request, response, session);

                break;


            default:

                addRole(request, response, session);

                break;
        }
    }


    private void addRole(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession session)
            throws IOException {

        String roleName = request.getParameter("roleName");
        String status = request.getParameter("status");

        Role role = new Role();

        role.setRoleName(roleName);
        role.setStatus(status);

        String createdBy = "Admin";

        role.setCreatedBy(createdBy);

        boolean result = roleService.addRole(role);

        if (result) {

            session.setAttribute(
                    "success",
                    "Role added successfully."
            );

        } else {

            session.setAttribute(
                    "error",
                    "Failed to add role."
            );
        }

        response.sendRedirect(
                request.getContextPath() + "/admin/roles"
        );
    }


    private void updateRole(HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session)
            throws IOException {

        int roleId = Integer.parseInt(
                request.getParameter("roleId")
        );

        String roleName = request.getParameter("roleName");
        String status = request.getParameter("status");

        Role role = new Role();

        role.setRoleId(roleId);
        role.setRoleName(roleName);
        role.setStatus(status);

        String modifiedBy = "Admin";

        role.setModifiedBy(modifiedBy);

        boolean result = roleService.updateRole(role);

        if (result) {

            session.setAttribute(
                    "success",
                    "Role updated successfully."
            );

        } else {

            session.setAttribute(
                    "error",
                    "Failed to update role."
            );
        }

        response.sendRedirect(
                request.getContextPath() + "/admin/roles"
        );
    }


    private void deleteRole(HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session)
            throws IOException {

        int roleId = Integer.parseInt(
                request.getParameter("roleId")
        );

        try {
            boolean result = roleService.deleteRole(roleId);

            if (result) {
                session.setAttribute(
                        "success",
                        "Role deleted successfully."
                );
            } else {
                session.setAttribute(
                        "error",
                        "Failed to delete role."
                );
            }

        } catch (RuntimeException e) {
            session.setAttribute(
                    "error",
                    e.getMessage()
            );
        }
        response.sendRedirect(
                request.getContextPath() + "/admin/roles"
        );
    }
}