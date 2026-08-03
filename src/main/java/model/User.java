package model;

public class User {
    private String name;
    private String email;
    private String department;
    private String role;
    private boolean isupdate;

    public String password() {
        return password;
    }

    private String  password;


    public boolean isupdate() {
        return isupdate;
    }
    public void setIsupdate(boolean isupdate) {
        this.isupdate = isupdate;
    }


    public User(String name, String email, String department, String role) {
        this.name = name;
        this.email = email;
        this.department = department;
        this.role = role;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }






}
