package controller.AuthController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.Auth.AuthDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.AuthUser.Users;
import util.GoogleOAuthConfig;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@WebServlet("/oauth/callback")
public class GoogleCallbackServlet extends HttpServlet {

    private AuthDao authDao = new AuthDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");

        String data =
                "code=" + code
                        + "&client_id=" + GoogleOAuthConfig.CLIENT_ID
                        + "&client_secret=" + GoogleOAuthConfig.CLIENT_SECRET
                        + "&redirect_uri=" + GoogleOAuthConfig.REDIRECT_URI
                        + "&grant_type=authorization_code";

        HttpClient client = HttpClient.newHttpClient();

        HttpRequest tokenRequest = HttpRequest.newBuilder()
                .uri(URI.create(GoogleOAuthConfig.TOKEN_URL))
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(HttpRequest.BodyPublishers.ofString(data))
                .build();

        HttpResponse<String> tokenResponse =
                null;
        try {
            tokenResponse = client.send(
                    tokenRequest,
                    HttpResponse.BodyHandlers.ofString()
            );
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        Gson gson = new Gson();

        JsonObject tokenJson =
                gson.fromJson(tokenResponse.body(), JsonObject.class);

        String accessToken =
                tokenJson.get("access_token").getAsString();

        System.out.println("Access Token received");

        HttpRequest userRequest = HttpRequest.newBuilder()
                .uri(URI.create(GoogleOAuthConfig.USER_INFO_URL))
                .header("Authorization", "Bearer " + accessToken)
                .GET()
                .build();

        HttpResponse<String> userResponse =
                null;
        try {
            userResponse = client.send(
                    userRequest,
                    HttpResponse.BodyHandlers.ofString()
            );
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        JsonObject userJson =
                gson.fromJson(userResponse.body(), JsonObject.class);

        String email =
                userJson.get("email").getAsString();

        System.out.println("Google Email: " + email);

        Users user = authDao.getUserByEmail(email);

        if (user == null) {
            response.getWriter().println("Google account is not registered in HRMS.");
            return;
        }

        HttpSession session = request.getSession();

        session.setAttribute("userId", user.getUserId());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("roleId", user.getRoleId());
        request.getRequestDispatcher(
                "/WEB-INF/views/Employee/dashboard.jsp"
        ).forward(request, response);


    }
}