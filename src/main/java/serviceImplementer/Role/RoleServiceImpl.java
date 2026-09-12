package serviceImplementer.Role;

import dao.Role.RoleDao;
import models.Employees.Role;
import service.Role.RoleService;

import java.util.List;

public class RoleServiceImpl implements RoleService {

    private RoleDao roleDao;

    public RoleServiceImpl() {
        roleDao = new RoleDao();
    }


    @Override
    public List<Role> getAllRoles() {

        return roleDao.getAllRoles();
    }


    @Override
    public Role getRoleById(int roleId) {

        return roleDao.getRoleById(roleId);
    }


    @Override
    public boolean addRole(Role role) {

        return roleDao.addRole(role);
    }


    @Override
    public boolean updateRole(Role role) {

        return roleDao.updateRole(role);
    }


    @Override
    public boolean deleteRole(int roleId) {

        return roleDao.deleteRole(roleId);
    }
}