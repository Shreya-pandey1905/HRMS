package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Documents.AddEmployeeDocNames;
import models.Employees.User;
import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/assign-employee-document")
public class AssignEmployeeDocumentServlet extends HttpServlet {

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

            // Get all employees
            List<User> employees =
                    documentService.getAllEmployees();

            // Get all employee document names
            List<AddEmployeeDocNames> documentNames =
                    documentService.getAllEmployeeDocumentNames();

            // Send data to JSP
            request.setAttribute(
                    "employees",
                    employees
            );

            request.setAttribute(
                    "documentNames",
                    documentNames
            );

            // Open assign page
            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/assignEmployeeDocument.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to load assign employee document page",
                    e
            );
        }
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Employee selected by admin
            int userId =
                    Integer.parseInt(
                            request.getParameter("userId")
                    );

            // Document selected by admin
            int documentId =
                    Integer.parseInt(
                            request.getParameter("documentId")
                    );


            // Assign document
            documentService.assignEmployeeDocument(
                    userId,
                    documentId
            );


            // Back to assign page
            response.sendRedirect(
                    request.getContextPath()
                            + "/assign-employee-document"
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to assign employee document",
                    e
            );
        }
    }
}