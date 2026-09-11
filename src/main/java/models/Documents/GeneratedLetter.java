package models.Documents;

public class GeneratedLetter {

    private int generatedLetterId;
    private int userId;
    private String employeeName;
    private String employeeEmail;
    private String letterName;
    private String letterFile;
    private String generatedDate;

    public GeneratedLetter() {
    }

    public GeneratedLetter(int generatedLetterId,
                           int userId,
                           String employeeName,
                           String employeeEmail,
                           String letterName,
                           String letterFile,
                           String generatedDate) {

        this.generatedLetterId = generatedLetterId;
        this.userId = userId;
        this.employeeName = employeeName;
        this.employeeEmail = employeeEmail;
        this.letterName = letterName;
        this.letterFile = letterFile;
        this.generatedDate = generatedDate;
    }

    public int getGeneratedLetterId() {
        return generatedLetterId;
    }

    public void setGeneratedLetterId(int generatedLetterId) {
        this.generatedLetterId = generatedLetterId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public String getLetterName() {
        return letterName;
    }

    public void setLetterName(String letterName) {
        this.letterName = letterName;
    }

    public String getLetterFile() {
        return letterFile;
    }

    public void setLetterFile(String letterFile) {
        this.letterFile = letterFile;
    }

    public String getGeneratedDate() {
        return generatedDate;
    }

    public void setGeneratedDate(String generatedDate) {
        this.generatedDate = generatedDate;
    }
}