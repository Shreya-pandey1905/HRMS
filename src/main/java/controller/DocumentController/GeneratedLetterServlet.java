package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import models.Documents.GeneratedLetter;
import models.Employees.User;

import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/generated-letter")
@MultipartConfig
public class GeneratedLetterServlet extends HttpServlet {

    private DocumentService documentService;

    @Override
    public void init() {
        documentService = new DocumentServiceImpl();
    }


    // =========================
    // LOAD PAGE
    // =========================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action =
                    request.getParameter("action");

            // DELETE LETTER
            if ("delete".equalsIgnoreCase(action)) {

                int id =
                        Integer.parseInt(
                                request.getParameter("id")
                        );

                documentService.deleteGeneratedLetter(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/generated-letter"
                );

                return;
            }


            // GET EMPLOYEE LIST

            List<User> employees =
                    documentService.getAllEmployees();


            // GET GENERATED LETTER LIST

            List<GeneratedLetter> letters =
                    documentService.getAllGeneratedLetters();


            request.setAttribute(
                    "employees",
                    employees
            );

            request.setAttribute(
                    "letters",
                    letters
            );


            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/generatedLetter.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to load generated letter page",
                    e
            );
        }
    }


    // =========================
    // SAVE LETTER
    // =========================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // EMPLOYEE

            String userIdParameter =
                    request.getParameter("userId");

            if (userIdParameter == null ||
                    userIdParameter.trim().isEmpty()) {

                throw new ServletException(
                        "Please select an employee"
                );
            }

            int userId =
                    Integer.parseInt(
                            userIdParameter
                    );


            // LETTER NAME

            String letterName =
                    request.getParameter("letterName");

            if (letterName == null ||
                    letterName.trim().isEmpty()) {

                throw new ServletException(
                        "Please enter letter name"
                );
            }


            // FILE

            Part filePart =
                    request.getPart("letterFile");

            if (filePart == null ||
                    filePart.getSize() == 0) {

                throw new ServletException(
                        "Please select a letter file"
                );
            }


            String originalFileName =
                    extractFileName(filePart);

            if (originalFileName == null ||
                    originalFileName.trim().isEmpty()) {

                throw new ServletException(
                        "Invalid file"
                );
            }


            String fileName =
                    new File(
                            originalFileName
                    ).getName();


            // UPLOAD DIRECTORY

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


            // UNIQUE FILE NAME

            String savedFileName =
                    System.currentTimeMillis()
                            + "_"
                            + fileName;


            String physicalFilePath =
                    uploadPath
                            + File.separator
                            + savedFileName;


            filePart.write(
                    physicalFilePath
            );


            // DATABASE FILE PATH

            String databaseFilePath =
                    "/uploads/"
                            + savedFileName;


            // CREATE MODEL

            GeneratedLetter letter =
                    new GeneratedLetter();


            letter.setUserId(
                    userId
            );


            letter.setLetterName(
                    letterName.trim()
            );


            letter.setLetterFile(
                    databaseFilePath
            );


            // SAVE

            documentService.addGeneratedLetter(
                    letter
            );


            // REDIRECT

            response.sendRedirect(
                    request.getContextPath()
                            + "/generated-letter"
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to save generated letter",
                    e
            );
        }
    }


    // =========================
    // FILE NAME
    // =========================

    private String extractFileName(
            Part part) {

        String contentDisposition =
                part.getHeader(
                        "content-disposition"
                );

        if (contentDisposition == null) {
            return null;
        }


        for (String item :
                contentDisposition.split(";")) {

            if ("filename".equals(
                    item.trim()
                            .split("=")[0])) {

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