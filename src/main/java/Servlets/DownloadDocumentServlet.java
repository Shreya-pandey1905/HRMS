package Servlets;

import Dao.DocumentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Document;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/downloadDocument")
public class DownloadDocumentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {

            Document document =DocumentDao.findById(id);
            resp.setContentType(document.getContentType());
            resp.setHeader("Content-Disposition","attachment; filename=" + document.getFileName());
            resp.setContentLengthLong(document.getFileSize());
            resp.getOutputStream().write(document.getFileData());


        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
