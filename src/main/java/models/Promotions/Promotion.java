package models.Promotions;

import java.time.LocalDateTime;

public class Promotion {

    private int promotionId;
    private int userId;

    private String designationFrom;
    private String designationTo;

    private LocalDateTime date;

    // For Promotion List display
    private String firstName;
    private String lastName;
    private String department;


    public Promotion() {
    }


    // =========================
    // PROMOTION ID
    // =========================

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }


    // =========================
    // USER ID
    // =========================

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    // =========================
    // DESIGNATION FROM
    // =========================

    public String getDesignationFrom() {
        return designationFrom;
    }

    public void setDesignationFrom(String designationFrom) {
        this.designationFrom = designationFrom;
    }


    // =========================
    // DESIGNATION TO
    // =========================

    public String getDesignationTo() {
        return designationTo;
    }

    public void setDesignationTo(String designationTo) {
        this.designationTo = designationTo;
    }


    // =========================
    // DATE
    // =========================

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }


    // =========================
    // FIRST NAME
    // =========================

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    // =========================
    // LAST NAME
    // =========================

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    // =========================
    // DEPARTMENT
    // =========================

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}