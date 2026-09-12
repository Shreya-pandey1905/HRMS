package serviceImplementer.Auth;

import dao.Employees.UserDao;
import models.Employees.User;
import service.User.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private final UserDao userDao;

    public UserServiceImpl() {
        this.userDao = new UserDao();
    }

    @Override
    public List<User> getAllEmployees() {
        return userDao.getAllEmployees();
    }
}
