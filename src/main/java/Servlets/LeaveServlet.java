package Servlets;

import Dao.LeaveDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Leave;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/leave")
public class LeaveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Leave> leaves = LeaveDao.getAllLeave();
            req.setAttribute("leaves", leaves);
            RequestDispatcher rd = req.getRequestDispatcher("Leave.jsp");
            rd.forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
