package models.Payroll;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Deduction {

    private Integer deductionId;
    private Integer deductionTypeId;
    private Integer departmentId;
    private Integer designationId;
    private BigDecimal deductionPercentage;
    private LocalDateTime createdAt;
    private String createdBy;
    private LocalDateTime modifiedAt;
    private String modifiedBy;

    public Integer getDeductionId() {
        return deductionId;
    }

    public void setDeductionId(Integer deductionId) {
        this.deductionId = deductionId;
    }

    public Integer getDeductionTypeId() {
        return deductionTypeId;
    }

    public void setDeductionTypeId(Integer deductionTypeId) {
        this.deductionTypeId = deductionTypeId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getDesignationId() {
        return designationId;
    }

    public void setDesignationId(Integer designationId) {
        this.designationId = designationId;
    }

    public BigDecimal getDeductionPercentage() {
        return deductionPercentage;
    }

    public void setDeductionPercentage(BigDecimal deductionPercentage) {
        this.deductionPercentage = deductionPercentage;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDateTime getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(LocalDateTime modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Override
    public String toString() {
        return "Deduction{" +
                "deductionId=" + deductionId +
                ", deductionTypeId=" + deductionTypeId +
                ", departmentId=" + departmentId +
                ", designationId=" + designationId +
                ", deductionPercentage=" + deductionPercentage +
                ", createdAt=" + createdAt +
                ", createdBy='" + createdBy + '\'' +
                ", modifiedAt=" + modifiedAt +
                ", modifiedBy='" + modifiedBy + '\'' +
                '}';
    }
}
