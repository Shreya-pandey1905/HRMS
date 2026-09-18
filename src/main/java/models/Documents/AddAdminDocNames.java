package models.Documents;

public class AddAdminDocNames {

    private int id;
    private String docName;

    public AddAdminDocNames() {
    }

    public AddAdminDocNames(int id, String docName) {
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