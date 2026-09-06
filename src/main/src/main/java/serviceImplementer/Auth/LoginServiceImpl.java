package serviceImplementer.Auth;

import dao.Auth.AuthDao;
import models.AuthUser.Users;
import service.Auth.LoginService;
import util.PasswordUtil;

public class LoginServiceImpl implements LoginService {

    private AuthDao authDao = new AuthDao();

    @Override
    public Users login(String email, String password) {

        if (email == null) {
            throw new RuntimeException("Email is required");
        }
        if (password == null) {
            throw new RuntimeException("Password is required");
        }
        Users user = authDao.getUserByEmail(email);
        if (user == null) {
            throw new RuntimeException("Invalid email or password");
        }
        String hashedPassword = PasswordUtil.hash(password);
        if (!hashedPassword.equals(user.getPasswordHash())) {
            throw new RuntimeException("Invalid email or password");
        }
        if (!"Active".equalsIgnoreCase(user.getStatus())) {
            throw new RuntimeException("User account is inactive");
        }

        return user;
    }
}