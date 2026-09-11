package models.Documents;

public class AddEmployeeDocNames {

    private int id;
    private String docName;

    public AddEmployeeDocNames() {
    }

    public AddEmployeeDocNames(int id, String docName) {
        this.id = id;
        this.docName = docName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }
}