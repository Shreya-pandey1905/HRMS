package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Documents.AddAdminDocNames;
import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-document-names")
public class AddAdminDocNamesServlet extends HttpServlet {

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

            String action = request.getParameter("action");

            // OPEN ADD ADMIN DOCUMENT NAME PAGE
            if ("add".equalsIgnoreCase(action)) {

                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/addAdminDocumentName.jsp"
                ).forward(request, response);

                return;
            }

            // DELETE ADMIN DOCUMENT NAME
            if ("delete".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                documentService.deleteAdminDocumentName(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin-document-names"
                );

                return;
            }

            // ADMIN DOCUMENT NAME LIST
            List<AddAdminDocNames> documentNames =
                    documentService.getAllAdminDocumentNames();

            request.setAttribute(
                    "documentNames",
                    documentNames
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/adminDocumentNames.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to process admin document names",
                    e
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action = request.getParameter("action");

            // EDIT ADMIN DOCUMENT NAME
            if ("edit".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                String docName =
                        request.getParameter("docName");

                documentService.updateAdminDocumentName(
                        id,
                        docName
                );

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin-document-names"
                );

                return;
            }

            // ADD ADMIN DOCUMENT NAME
            String docName =
                    request.getParameter("docName");

            AddAdminDocNames documentName =
                    new AddAdminDocNames();

            documentName.setDocName(docName);

            documentService.addAdminDocumentName(
                    documentName
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin-document-names"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to save admin document name",
                    e
            );
        }
    }
}