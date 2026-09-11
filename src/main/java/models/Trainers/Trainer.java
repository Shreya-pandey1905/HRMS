package models.Trainers;

public class Trainer {

    private int trainerId;
    private String firstName;
    private String lastName;
    private String role;
    private String email;
    private String description;
    private String status;
    private long phone;
    private String profilePicture;

    public Trainer() {
    }

    public Trainer(int trainerId,
                   String firstName,
                   String lastName,
                   String role,
                   String email,
                   String description,
                   String status,
                   long phone,
                   String profilePicture) {

        this.trainerId = trainerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.email = email;
        this.description = description;
        this.status = status;
        this.phone = phone;
        this.profilePicture = profilePicture;
    }

    public int getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(int trainerId) {
        this.trainerId = trainerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }
}