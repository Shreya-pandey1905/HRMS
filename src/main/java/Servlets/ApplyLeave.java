package Servlets;

import Dao.LeaveDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
@WebServlet("/ApplyLeave")
public class ApplyLeave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int user_id = 1;
        String user_name = "ankush";
        String type = req.getParameter("type");
        Date startDate = Date.valueOf(req.getParameter("startDate"));
        Date endDate = Date.valueOf(req.getParameter("endDate"));
        String reason = req.getParameter("reason");
        try {
            boolean isLeaveAdded = LeaveDao.addLeave(user_id,user_name,type,startDate,endDate,reason);
            if(isLeaveAdded){
                resp.sendRedirect("leave");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }
}
