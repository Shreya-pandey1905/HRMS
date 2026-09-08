package controller.AuthController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import util.GoogleOAuthConfig;

@WebServlet("/oauth/login")
public class GoogleLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String googleUrl=GoogleOAuthConfig.AUTH_URL
                        + "?client_id=" + GoogleOAuthConfig.CLIENT_ID
                        + "&redirect_uri=" + GoogleOAuthConfig.REDIRECT_URI
                        + "&response_type=code"
                        + "&scope=openid%20email%20profile";

        response.sendRedirect(googleUrl);
    }
}