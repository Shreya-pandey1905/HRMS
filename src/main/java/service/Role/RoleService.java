package service.Role;

import models.Employees.Role;

import java.util.List;

public interface RoleService {

    List<Role> getAllRoles();

    Role getRoleById(int roleId);

    boolean addRole(Role role);

    boolean updateRole(Role role);

    boolean deleteRole(int roleId);
}