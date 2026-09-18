package models.Documents;

public class AdminDocuments {

    private int adminDocId;
    private String email;
    private String docName;
    private String docFile;
    private String employeeName;

    public AdminDocuments() {
    }

    public AdminDocuments(int adminDocId,
                          String email,
                          String docName,
                          String docFile,
                          String employeeName) {

        this.adminDocId = adminDocId;
        this.email = email;
        this.docName = docName;
        this.docFile = docFile;
        this.employeeName = employeeName;
    }

    public int getAdminDocId() {
        return adminDocId;
    }

    public void setAdminDocId(int adminDocId) {
        this.adminDocId = adminDocId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocFile() {
        return docFile;
    }

    public void setDocFile(String docFile) {
        this.docFile = docFile;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
}