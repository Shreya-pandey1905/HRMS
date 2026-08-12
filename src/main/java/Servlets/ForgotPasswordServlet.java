package Servlets;
import Dao.UserDao;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import utils.MailConfig;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        String email=req.getParameter("email");
        UserDao userDao=new UserDao();
        try{
            User user=userDao.findByEmail(email);
            if(user!=null){
                String token=UUID.randomUUID().toString();
                userDao.saveResetToken(email,token);
                String resetLink="http://localhost:8080/HRMS/Employeejsp/forgotResetPassword.jsp?token="+token;
                String subject="HRMS Password Reset";
                String message="Hello,\n\n"+"You requested to reset your HRMS password.\n\n"+"Click the link below to reset your password:\n\n"+resetLink;
                MailConfig.sendMail(email,subject,message);
                req.setAttribute("success","Reset link sent successfully! Please check your email.");
            }else{
                req.setAttribute("error","Email not registered.");
            }
            req.getRequestDispatcher("/Employeejsp/forgotPassword.jsp").forward(req,resp);
        }catch(MessagingException e){
            e.printStackTrace();
            req.setAttribute("error","Failed to send reset email.");
            req.getRequestDispatcher("/Employeejsp/forgotPassword.jsp").forward(req,resp);
        }catch(Exception e){
            e.printStackTrace();
            req.setAttribute("error","Something went wrong.");
            req.getRequestDispatcher("/Employeejsp/forgotPassword.jsp").forward(req,resp);
        }
    }
}