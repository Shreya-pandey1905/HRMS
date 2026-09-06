package service.Auth;

import models.AuthUser.Users;

public interface LoginService {
    Users login(String email, String password);

}
