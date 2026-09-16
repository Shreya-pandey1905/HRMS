package models.Payroll;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Earning {

    private Integer earningsId;
    private Integer earntypeId;
    private BigDecimal earningsPercentage;
    private Integer departmentId;
    private Integer designationId;
    private String createdBy;
    private LocalDateTime createdAt;
    private String modifiedBy;
    private LocalDateTime modifiedAt;

    public Integer getEarningsId() {
        return earningsId;
    }

    public void setEarningsId(Integer earningsId) {
        this.earningsId = earningsId;
    }

    public Integer getEarntypeId() {
        return earntypeId;
    }

    public void setEarntypeId(Integer earntypeId) {
        this.earntypeId = earntypeId;
    }

    public BigDecimal getEarningsPercentage() {
        return earningsPercentage;
    }

    public void setEarningsPercentage(BigDecimal earningsPercentage) {
        this.earningsPercentage = earningsPercentage;
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

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public LocalDateTime getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(LocalDateTime modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    @Override
    public String toString() {
        return "Earning{" +
                "earningsId=" + earningsId +
                ", earntypeId=" + earntypeId +
                ", earningsPercentage=" + earningsPercentage +
                ", departmentId=" + departmentId +
                ", designationId=" + designationId +
                ", createdBy='" + createdBy + '\'' +
                ", createdAt=" + createdAt +
                ", modifiedBy='" + modifiedBy + '\'' +
                ", modifiedAt=" + modifiedAt +
                '}';
    }
}
