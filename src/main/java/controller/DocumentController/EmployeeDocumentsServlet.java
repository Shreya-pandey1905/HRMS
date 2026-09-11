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

@WebServlet("/employee-documents")
public class EmployeeDocumentsServlet extends HttpServlet {

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

            // Delete employee document
            if ("delete".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                documentService.deleteUploadedFile(id);

                response.sendRedirect(
                        request.getContextPath() +
                        "/employee-documents"
                );

                return;
            }

            // Get all employee uploaded documents
            List<FileUploads> employeeDocuments =
                    documentService.getAllUploadedFiles();

            request.setAttribute(
                    "employeeDocuments",
                    employeeDocuments
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/employeeDocuments.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to process employee documents",
                    e
            );
        }
    }
}