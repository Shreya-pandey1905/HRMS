package Servlets;

import Dao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.PasswordUtil;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/signin")
public class SigninServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("Text/html");
        String email =req.getParameter("email");
        String password =req.getParameter("password");
        User user = null;

        try {
            user = UserDao.findByEmail(email);
            if (user == null) {
                req.setAttribute("error", "Invalid email or password");
                RequestDispatcher rd = req.getRequestDispatcher("signin.jsp");
                rd.forward(req, resp);
                return;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        if (user.isupdate()==false){
            try {
                user = UserDao.findbyEmailAndPassword(email, password);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }else {
            try {
                String hashedPassword = PasswordUtil.hash(password);
                user = UserDao.findbyEmailAndPassword(email, hashedPassword);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

           if (user == null) {
                req.setAttribute("error", "Invalid email or password");
                RequestDispatcher rd = req.getRequestDispatcher("signin.jsp");
                rd.forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("name_key", user.getName());
                RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
                rd.include(req,resp);
                System.out.println("You are successfully logged in: " + user.getName());
            }
        }

    }



