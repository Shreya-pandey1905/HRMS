package serviceImplementer.Document;

import dao.Documents.AddAdminDocNamesDao;
import dao.Documents.AddEmployeeDocNamesDao;
import dao.Documents.AdminDocumentsDao;
import dao.Documents.EmployeeDocumentAssignmentDao;
import dao.Documents.FileUploadsDao;
import dao.Documents.GeneratedLetterDao;

import models.Documents.*;

import service.Documents.DocumentService;
import dao.Employee.EmployeeDao;
import models.Employees.User;

import java.util.List;

public class DocumentServiceImpl implements DocumentService {

    private EmployeeDao employeeDao = new EmployeeDao();

    private AddAdminDocNamesDao addAdminDocNamesDao =
            new AddAdminDocNamesDao();

    private AddEmployeeDocNamesDao addEmployeeDocNamesDao =
            new AddEmployeeDocNamesDao();

    private AdminDocumentsDao adminDocumentsDao =
            new AdminDocumentsDao();

    private FileUploadsDao fileUploadsDao =
            new FileUploadsDao();

    private GeneratedLetterDao generatedLetterDao =
            new GeneratedLetterDao();

    private EmployeeDocumentAssignmentDao employeeDocumentAssignmentDao =
            new EmployeeDocumentAssignmentDao();


    @Override
    public List<AddAdminDocNames> getAllAdminDocumentNames() {
        return addAdminDocNamesDao.getAll();
    }

    @Override
    public void addAdminDocumentName(AddAdminDocNames documentName) {

        if (documentName == null) {
            throw new RuntimeException("Document name is required");
        }

        if (documentName.getDocName() == null ||
                documentName.getDocName().trim().isEmpty()) {
            throw new RuntimeException("Document name is required");
        }

        addAdminDocNamesDao.add(documentName);
    }

    @Override
    public void updateAdminDocumentName(int id, String docName) {

    }

    @Override
    public void deleteAdminDocumentName(int id) {
        addAdminDocNamesDao.delete(id);
    }


    @Override
    public List<AddEmployeeDocNames> getAllEmployeeDocumentNames() {
        return addEmployeeDocNamesDao.getAll();
    }

    @Override
    public void addEmployeeDocumentName(AddEmployeeDocNames documentName) {

        if (documentName == null) {
            throw new RuntimeException("Document name is required");
        }

        if (documentName.getDocName() == null ||
                documentName.getDocName().trim().isEmpty()) {
            throw new RuntimeException("Document name is required");
        }

        addEmployeeDocNamesDao.add(documentName);
    }

    @Override
    public void deleteEmployeeDocumentName(int id) {
        addEmployeeDocNamesDao.delete(id);
    }


    // =========================
    // Employee Document Assignments
    // =========================

    @Override
    public List<EmployeeDocumentAssignment>
    getAllEmployeeDocumentAssignments() {

        return employeeDocumentAssignmentDao.getAll();
    }

    @Override
    public void assignEmployeeDocument(
            int userId,
            int documentId) {

        fileUploadsDao.assignDocument(userId, documentId);
    }


    // =========================
    // Admin Documents
    // =========================

    @Override
    public List<AdminDocuments> getAllAdminDocuments() {
        return adminDocumentsDao.getAll();
    }

    @Override
    public void addAdminDocument(AdminDocuments document) {

        if (document == null) {
            throw new RuntimeException("Admin document is required");
        }

        adminDocumentsDao.add(document);
    }

    @Override
    public void deleteAdminDocument(int adminDocId) {
        adminDocumentsDao.delete(adminDocId);
    }


    // =========================
    // Generated Letters
    // =========================

    @Override
    public List<GeneratedLetter> getAllGeneratedLetters() {
        return generatedLetterDao.getAll();
    }

    @Override
    public List<GeneratedLetter> getEmployeeCompanyLetters(int userId) {
        return generatedLetterDao.getEmployeeLetters(userId);
    }

    @Override
    public void addGeneratedLetter(GeneratedLetter letter) {

        if (letter == null) {
            throw new RuntimeException("Generated letter is required");
        }

        if (letter.getLetterName() == null ||
                letter.getLetterName().trim().isEmpty()) {
            throw new RuntimeException("Letter name is required");
        }

        if (letter.getLetterFile() == null ||
                letter.getLetterFile().trim().isEmpty()) {
            throw new RuntimeException("Letter file is required");
        }

        generatedLetterDao.add(letter);
    }

    @Override
    public void deleteGeneratedLetter(int generatedLetterId) {
        generatedLetterDao.delete(generatedLetterId);
    }


    // =========================
    // Employee Uploaded Documents
    // =========================

    @Override
    public List<FileUploads> getAllUploadedFiles() {
        return fileUploadsDao.getAll();
    }

    @Override
    public List<FileUploads> getEmployeeDocuments(int userId) {
        return fileUploadsDao.getEmployeeDocuments(userId);
    }

    @Override
    public void addUploadedFile(FileUploads file) {

        if (file == null) {
            throw new RuntimeException("File is required");
        }

        fileUploadsDao.add(file);
    }

    @Override
    public void deleteUploadedFile(int id) {
        fileUploadsDao.delete(id);
    }

    @Override
    public List<FileUploads> getPendingEmployeeDocuments(int userId) {
        return fileUploadsDao.getPendingDocuments(userId);
    }

    @Override
    public void markEmployeeDocumentSubmitted(
            int userId,
            int documentId) {

        fileUploadsDao.markDocumentSubmitted(userId, documentId);
    }


    // =========================
    // Employee List
    // =========================

    @Override
    public List<User> getAllEmployees() {
        return employeeDao.getAllEmployees();
    }
}