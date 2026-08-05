    package Servlets;

    import Dao.DocumentDao;
    import jakarta.servlet.RequestDispatcher;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
    import jakarta.servlet.http.HttpSession;
    import model.Document;
    import model.User;

    import java.io.IOException;
    import java.sql.SQLException;
    import java.util.List;

    @WebServlet("/documents")
    public class DocumentServlet extends HttpServlet {


        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            if (user != null) {
                try {
                    int userId = DocumentDao.getUserIdByEmail(user.getEmail());

                    List<Document> documents =  DocumentDao.findByuserId(userId);
                    req.setAttribute("documents", documents);
                    RequestDispatcher rd = req.getRequestDispatcher("documents.jsp");
                    rd.forward(req, resp);

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }

            }else {
                resp.sendRedirect("index.jsp");
            }

        }
    }


