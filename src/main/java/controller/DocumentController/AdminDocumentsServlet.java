package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import models.Documents.AddEmployeeDocNames;
import models.Documents.AdminDocuments;
import models.Employees.User;

import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin-documents")
@MultipartConfig
public class AdminDocumentsServlet extends HttpServlet {

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


            // =====================================================
            // OPEN ADMIN FILE UPLOAD PAGE
            // =====================================================

            if ("upload".equalsIgnoreCase(action)) {

                List<User> employees =
                        documentService.getAllEmployees();

                List<AddEmployeeDocNames> documentNames =
                        documentService.getAllEmployeeDocumentNames();


                request.setAttribute(
                        "employees",
                        employees
                );

                request.setAttribute(
                        "documentNames",
                        documentNames
                );


                request.getRequestDispatcher(
                        "/WEB-INF/views/Admin/adminFileUpload.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }


            // =====================================================
            // DELETE ADMIN DOCUMENT
            // =====================================================

            if ("delete".equalsIgnoreCase(action)) {

                int adminDocId =
                        Integer.parseInt(
                                request.getParameter("id")
                        );


                documentService.deleteAdminDocument(
                        adminDocId
                );


                response.sendRedirect(
                        request.getContextPath()
                                + "/admin-documents"
                );

                return;
            }


            // =====================================================
            // ADMIN DOCUMENT LIST
            // =====================================================

            List<AdminDocuments> documents =
                    documentService.getAllAdminDocuments();


            request.setAttribute(
                    "documents",
                    documents
            );


            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/adminDocuments.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to process admin documents",
                    e
            );
        }
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email =
                    request.getParameter("email");


            String[] docNames =
                    request.getParameterValues("docName");


            List<Part> fileParts =
                    new ArrayList<>();


            for (Part part : request.getParts()) {

                if ("docFile".equals(part.getName())
                        && part.getSize() > 0) {

                    fileParts.add(part);
                }
            }


            if (docNames == null ||
                    docNames.length == 0) {

                throw new ServletException(
                        "Please select a document"
                );
            }


            if (fileParts.isEmpty()) {

                throw new ServletException(
                        "Please select a document file"
                );
            }


            String uploadPath =
                    getServletContext()
                            .getRealPath("/uploads");


            if (uploadPath == null) {

                throw new ServletException(
                        "Unable to determine upload directory"
                );
            }


            File uploadDirectory =
                    new File(uploadPath);


            if (!uploadDirectory.exists()) {

                uploadDirectory.mkdirs();
            }


            for (int i = 0;
                 i < docNames.length &&
                         i < fileParts.size();
                 i++) {


                String docName =
                        docNames[i];


                Part filePart =
                        fileParts.get(i);


                String originalFileName =
                        getFileName(filePart);


                if (originalFileName == null ||
                        originalFileName.trim().isEmpty()) {

                    continue;
                }


                String fileName =
                        new File(
                                originalFileName
                        ).getName();


                String savedFileName =
                        System.currentTimeMillis()
                                + "_"
                                + i
                                + "_"
                                + fileName;


                String physicalFilePath =
                        uploadPath
                                + File.separator
                                + savedFileName;


                filePart.write(
                        physicalFilePath
                );


                String databaseFilePath =
                        "/uploads/"
                                + savedFileName;


                AdminDocuments document =
                        new AdminDocuments();


                document.setEmail(
                        email
                );


                document.setDocName(
                        docName
                );


                document.setDocFile(
                        databaseFilePath
                );


                documentService.addAdminDocument(
                        document
                );
            }


            // AFTER UPLOAD → ADMIN DOCUMENT LIST

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin-documents"
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to save admin document",
                    e
            );
        }
    }


    private String getFileName(Part part) {

        String contentDisposition =
                part.getHeader(
                        "content-disposition"
                );


        if (contentDisposition == null) {

            return null;
        }


        for (String item :
                contentDisposition.split(";")) {

            if (item.trim()
                    .startsWith("filename")) {

                String fileName =
                        item.substring(
                                item.indexOf('=') + 1
                        ).trim();


                return fileName.replace(
                        "\"",
                        ""
                );
            }
        }


        return null;
    }
}