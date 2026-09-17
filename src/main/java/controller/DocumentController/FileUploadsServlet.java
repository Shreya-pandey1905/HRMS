package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.Documents.AddEmployeeDocNames;
import models.Documents.FileUploads;
import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/file-uploads")
@MultipartConfig
public class FileUploadsServlet extends HttpServlet {

    private DocumentService documentService;

    @Override
    public void init() {

        documentService =
                new DocumentServiceImpl();
    }


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action =
                    request.getParameter("action");


            // =====================================================
            // DELETE EMPLOYEE DOCUMENT
            // =====================================================

            if ("delete".equalsIgnoreCase(action)) {

                int id =
                        Integer.parseInt(
                                request.getParameter("id")
                        );

                documentService.deleteUploadedFile(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/file-uploads?action=list"
                );

                return;
            }


            // =====================================================
            // GET LOGGED-IN EMPLOYEE ID
            // =====================================================

            HttpSession session =
                    request.getSession(false);

            Integer userId = null;


            if (session != null) {

                Object sessionUserId =
                        session.getAttribute("userId");


                if (sessionUserId instanceof Integer) {

                    userId =
                            (Integer) sessionUserId;

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


            // =====================================================
            // MY DOCUMENTS - LIST ONLY
            // URL: /file-uploads?action=list
            // =====================================================

            if ("list".equalsIgnoreCase(action)) {

                List<FileUploads> files =
                        documentService.getEmployeeDocuments(
                                userId
                        );


                request.setAttribute(
                        "files",
                        files
                );


                request.setAttribute(
                        "userId",
                        userId
                );


                request.getRequestDispatcher(
                        "/WEB-INF/views/Employee/myDocuments.jsp"
                ).forward(
                        request,
                        response
                );


                return;
            }


            // =====================================================
            // UPLOAD DOCUMENTS PAGE
            // URL: /file-uploads
            // =====================================================

            List<AddEmployeeDocNames> documentNames =
                    documentService
                            .getAllEmployeeDocumentNames();


            // Documents assigned by Admin but not submitted
            List<FileUploads> pendingDocuments =
                    documentService
                            .getPendingEmployeeDocuments(
                                    userId
                            );


            request.setAttribute(
                    "documentNames",
                    documentNames
            );


            request.setAttribute(
                    "pendingDocuments",
                    pendingDocuments
            );


            request.setAttribute(
                    "userId",
                    userId
            );


            request.getRequestDispatcher(
                    "/WEB-INF/views/Employee/uploadDocuments.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to process uploaded files",
                    e
            );
        }
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // =====================================================
            // GET LOGGED-IN EMPLOYEE ID
            // =====================================================

            HttpSession session =
                    request.getSession(false);

            System.out.println("SESSION = " + session);
            System.out.println("USER ID = " + (session != null ? session.getAttribute("userId") : null));

            Integer userId = null;


            if (session != null) {

                Object sessionUserId =
                        session.getAttribute("userId");


                if (sessionUserId instanceof Integer) {

                    userId =
                            (Integer) sessionUserId;

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


            // =====================================================
            // GET MULTIPLE DOCUMENT TYPES
            // =====================================================

            String[] documentIds =
                    request.getParameterValues(
                            "documentId"
                    );


            List<Part> fileParts =
                    new ArrayList<>();


            // =====================================================
            // GET MULTIPLE FILES
            // =====================================================

            for (Part part :
                    request.getParts()) {

                if ("file".equals(part.getName())
                        && part.getSize() > 0) {

                    fileParts.add(part);
                }
            }


            // =====================================================
            // UPLOAD DOCUMENTS
            // =====================================================

            if (documentIds != null) {

                for (int i = 0;
                     i < documentIds.length;
                     i++) {


                    // Make sure file exists
                    if (i >= fileParts.size()) {

                        break;
                    }


                    String documentIdParameter =
                            documentIds[i];


                    if (documentIdParameter == null
                            || documentIdParameter
                            .trim()
                            .isEmpty()) {

                        continue;
                    }


                    int documentId =
                            Integer.parseInt(
                                    documentIdParameter
                            );


                    Part filePart =
                            fileParts.get(i);


                    String originalFileName =
                            extractFileName(
                                    filePart
                            );


                    if (originalFileName == null
                            || originalFileName
                            .trim()
                            .isEmpty()) {

                        continue;
                    }


                    // Remove path information
                    String fileName =
                            new File(
                                    originalFileName
                            ).getName();


                    // =================================================
                    // UPLOAD DIRECTORY
                    // =================================================

                    String uploadPath =
                            getServletContext()
                                    .getRealPath(
                                            "/uploads"
                                    );


                    if (uploadPath == null) {

                        throw new ServletException(
                                "Unable to determine upload directory"
                        );
                    }


                    File uploadDirectory =
                            new File(
                                    uploadPath
                            );


                    if (!uploadDirectory.exists()) {

                        uploadDirectory.mkdirs();
                    }


                    // =================================================
                    // UNIQUE FILE NAME
                    // =================================================

                    String savedFileName =
                            System.currentTimeMillis()
                                    + "_"
                                    + fileName;


                    String physicalFilePath =
                            uploadPath
                                    + File.separator
                                    + savedFileName;


                    // Save physical file
                    filePart.write(
                            physicalFilePath
                    );


                    // =================================================
                    // DATABASE FILE PATH
                    // =================================================

                    String databaseFilePath =
                            "/uploads/"
                                    + savedFileName;


                    FileUploads file =
                            new FileUploads();


                    file.setFileName(
                            fileName
                    );


                    file.setFilePath(
                            databaseFilePath
                    );


                    file.setUserId(
                            userId
                    );


                    file.setDocumentId(
                            documentId
                    );


                    // Save document
                    documentService.addUploadedFile(
                            file
                    );


                    // =================================================
                    // MARK ASSIGNED DOCUMENT AS SUBMITTED
                    // =================================================

                    documentService
                            .markEmployeeDocumentSubmitted(
                                    userId,
                                    documentId
                            );
                }
            }


            // =====================================================
            // AFTER UPLOAD → MY DOCUMENTS LIST
            // =====================================================

            response.sendRedirect(
                    request.getContextPath()
                            + "/file-uploads?action=list"
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to save uploaded files",
                    e
            );
        }
    }


    // =============================================================
    // EXTRACT FILE NAME
    // =============================================================

    private String extractFileName(Part part) {

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
                                )
                                .trim();


                return fileName.replace(
                        "\"",
                        ""
                );
            }
        }


        return null;
    }
}