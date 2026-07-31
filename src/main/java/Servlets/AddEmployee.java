package Servlets;

import Dao.UserDao;
import jakarta.mail.MessagingException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import utils.MailConfig;
import utils.PasswordUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String department = req.getParameter("department");
        String password = name+"123";
        String hashpassword = PasswordUtil.hash(password);
        try {
            boolean iscreated = UserDao.addEmployee(name,email,department,hashpassword);
            PrintWriter out = resp.getWriter();
            if(iscreated){
                String to = email;
                String subject = "register successfully";
                String message = "hey "+name+" you have register successfully\n and your default password is ="+hashpassword+"\nkindly change the password after first login";
                MailConfig.sendMail(to,subject,message);
                resp.getWriter().println("mail sent successfully");
//                out.println(
//                        "<html>" +
//                                "<body style='background-color:#f8f9fa;'>" +
//                                "<h1 style='color:green; text-align:center; margin-top:100px;'>Employee Added Successfully!</h1>" +
//                                "</body>" +
//                                "</html>"
//                );
                resp.sendRedirect("employee");
            }else{
                out.println(
                        "<html>" +
                                "<body style='background-color:#f8f9fa;'>" +
                                "<h1 style='color:red; text-align:center; margin-top:100px;'>Employee Could Not Be Added!</h1>" +
                                "</body>" +
                                "</html>"
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (MessagingException e) {
            resp.getWriter().println("failed to send mail");
            throw new RuntimeException(e);
        }


    }
}
