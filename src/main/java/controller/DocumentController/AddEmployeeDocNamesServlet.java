package controller.DocumentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Documents.AddEmployeeDocNames;
import models.Documents.EmployeeDocumentAssignment;
import models.Employees.User;

import service.Documents.DocumentService;
import serviceImplementer.Document.DocumentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/employee-document-names")
public class AddEmployeeDocNamesServlet extends HttpServlet {

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


            // OPEN ADD EMPLOYEE DOCUMENT PAGE

            if ("add".equalsIgnoreCase(action)) {

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
                        "/WEB-INF/views/Admin/addEmployeeDocumentName.jsp"
                ).forward(request, response);

                return;
            }


            // DELETE EMPLOYEE DOCUMENT NAME
            // KEEPING EXISTING FUNCTIONALITY

            if ("delete".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                documentService.deleteEmployeeDocumentName(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/employee-document-names"
                );

                return;
            }


            // EMPLOYEE DOCUMENT ASSIGNMENT LIST

            List<EmployeeDocumentAssignment> assignments =
                    documentService
                            .getAllEmployeeDocumentAssignments();

            request.setAttribute(
                    "assignments",
                    assignments
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/Admin/employeeDocumentNames.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to process employee document assignments",
                    e
            );
        }
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int userId = Integer.parseInt(
                    request.getParameter("userId")
            );

            int documentId = Integer.parseInt(
                    request.getParameter("documentId")
            );


            // ASSIGN DOCUMENT TO EMPLOYEE

            documentService.assignEmployeeDocument(
                    userId,
                    documentId
            );


            // REDIRECT TO EMPLOYEE DOCUMENT LIST

            response.sendRedirect(
                    request.getContextPath()
                            + "/employee-document-names"
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to assign employee document",
                    e
            );
        }
    }
}