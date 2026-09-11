package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Documents.FileUploads;
import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-employee-documents")
public class AdminEmployeeDocumentsServlet extends HttpServlet {

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

            // DELETE
            if ("delete".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                documentService.deleteUploadedFile(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin-employee-documents"
                );

                return;
            }

            // GET ALL EMPLOYEE UPLOADED DOCUMENTS
            List<FileUploads> files =
                    documentService.getAllUploadedFiles();

            request.setAttribute("files", files);

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/adminEmployeeDocuments.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to load employee documents",
                    e
            );
        }
    }
}