package models.Trainers;

public class TrainingType {

    private int trainingTypeId;
    private String trainingTypeName;
    private String description;
    private String status;

    public TrainingType() {
    }

    public TrainingType(int trainingTypeId, String trainingTypeName,
                        String description, String status) {
        this.trainingTypeId = trainingTypeId;
        this.trainingTypeName = trainingTypeName;
        this.description = description;
        this.status = status;
    }

    public int getTrainingTypeId() {
        return trainingTypeId;
    }

    public void setTrainingTypeId(int trainingTypeId) {
        this.trainingTypeId = trainingTypeId;
    }

    public String getTrainingTypeName() {
        return trainingTypeName;
    }

    public void setTrainingTypeName(String trainingTypeName) {
        this.trainingTypeName = trainingTypeName;
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
}
