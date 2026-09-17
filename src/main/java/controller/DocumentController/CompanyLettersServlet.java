package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.Documents.AdminDocuments;
import models.Documents.GeneratedLetter;
import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/company-letters")
public class CompanyLettersServlet extends HttpServlet {

    private DocumentService documentService;

    @Override
    public void init() {
        documentService = new DocumentServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            Integer userId = null;

            if (session != null) {

                Object sessionUserId =
                        session.getAttribute("userId");

                if (sessionUserId instanceof Integer) {

                    userId = (Integer) sessionUserId;

                } else if (sessionUserId != null) {

                    userId =
                            Integer.parseInt(
                                    sessionUserId.toString()
                            );
                }
            }

            if (userId == null) {

                throw new ServletException(
                        "User ID is not available in session"
                );
            }

            List<GeneratedLetter> letters =
                    documentService.getEmployeeCompanyLetters(
                            userId
                    );

            request.setAttribute(
                    "letters",
                    letters
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Employee/companyLetters.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to load company letters",
                    e
            );
        }
    }
}