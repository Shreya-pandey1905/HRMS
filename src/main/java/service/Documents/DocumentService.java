package service.Documents;

import models.Documents.AddAdminDocNames;
import models.Documents.AddEmployeeDocNames;
import models.Documents.AdminDocuments;
import models.Documents.EmployeeDocumentAssignment;
import models.Documents.FileUploads;
import models.Documents.GeneratedLetter;
import models.Employees.User;

import java.util.List;

public interface DocumentService {

    // Admin Document Names
    List<AddAdminDocNames> getAllAdminDocumentNames();

    void addAdminDocumentName(
            AddAdminDocNames documentName
    );

    void updateAdminDocumentName(
            int id,
            String docName
    );

    void deleteAdminDocumentName(int id);


    // Employee Document Names
    List<AddEmployeeDocNames> getAllEmployeeDocumentNames();

    void addEmployeeDocumentName(
            AddEmployeeDocNames documentName
    );

    void deleteEmployeeDocumentName(int id);


    // Employee Document Assignments
    List<EmployeeDocumentAssignment>
    getAllEmployeeDocumentAssignments();

    void assignEmployeeDocument(
            int userId,
            int documentId
    );


    // Admin Documents
    List<AdminDocuments> getAllAdminDocuments();

    void addAdminDocument(
            AdminDocuments document
    );

    void deleteAdminDocument(int adminDocId);


    // Generated Letters
    List<GeneratedLetter> getAllGeneratedLetters();

    List<GeneratedLetter> getEmployeeCompanyLetters(
            int userId
    );

    void addGeneratedLetter(
            GeneratedLetter letter
    );

    void deleteGeneratedLetter(
            int generatedLetterId
    );


    // Employee Uploaded Documents
    List<FileUploads> getAllUploadedFiles();

    List<FileUploads> getEmployeeDocuments(int userId);

    void addUploadedFile(FileUploads file);

    void deleteUploadedFile(int id);


    // Employee Document Assignment
    List<FileUploads> getPendingEmployeeDocuments(
            int userId
    );

    void markEmployeeDocumentSubmitted(
            int userId,
            int documentId
    );


    // Employee List
    List<User> getAllEmployees();

}