package Servlets;

import Dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.PasswordUtil;

import java.io.IOException;

@WebServlet("/forgotResetPassword")
public class forgotResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)  throws ServletException, IOException {

        String token = req.getParameter("token");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("error","New passwords do not match");

            req.getRequestDispatcher("/Employeejsp/forgotResetPassword.jsp" ).forward(req, resp);
        }else {
            UserDao userDao = new UserDao();
            try {
                String email = userDao.getEmailByResetToken(token);
                if (email == null) { req.setAttribute("error","Invalid reset link");
                    req.getRequestDispatcher("/Employeejsp/forgotResetPassword.jsp" ).forward(req, resp);
                    return;
                }
                String hashedPassword =PasswordUtil.hash(newPassword);
                boolean updated = userDao.updatePasswordUsingToken(token,hashedPassword);
                if (updated) {
                    resp.sendRedirect(req.getContextPath() + "/index.jsp");
                } else {
                    req.setAttribute("error","Password could not be updated");

                    req.getRequestDispatcher("/Employeejsp/forgotResetPassword.jsp").forward(req, resp);
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error","Something went wrong");
            }
        }

    }
}