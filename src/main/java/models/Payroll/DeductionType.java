package models.Payroll;

public class DeductionType {

    private Integer deductionTypeId;
    private String deductionsName;

    public Integer getDeductionTypeId() {
        return deductionTypeId;
    }

    public void setDeductionTypeId(Integer deductionTypeId) {
        this.deductionTypeId = deductionTypeId;
    }

    public String getDeductionsName() {
        return deductionsName;
    }

    public void setDeductionsName(String deductionsName) {
        this.deductionsName = deductionsName;
    }

    @Override
    public String toString() {
        return "DeductionType{" +
                "deductionTypeId=" + deductionTypeId +
                ", deductionsName='" + deductionsName + '\'' +
                '}';
    }
}
