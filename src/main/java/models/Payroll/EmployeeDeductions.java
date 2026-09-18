package models.Payroll;

import java.math.BigDecimal;

public class EmployeeDeductions {

    private Integer employeeDeductionId;
    private Integer salaryId;
    private Integer userId;
    private Integer deductionId;
    private BigDecimal deductionAmount;

    public Integer getEmployeeDeductionId() {
        return employeeDeductionId;
    }

    public void setEmployeeDeductionId(Integer employeeDeductionId) {
        this.employeeDeductionId = employeeDeductionId;
    }

    public Integer getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(Integer salaryId) {
        this.salaryId = salaryId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDeductionId() {
        return deductionId;
    }

    public void setDeductionId(Integer deductionId) {
        this.deductionId = deductionId;
    }

    public BigDecimal getDeductionAmount() {
        return deductionAmount;
    }

    public void setDeductionAmount(BigDecimal deductionAmount) {
        this.deductionAmount = deductionAmount;
    }

    @Override
    public String toString() {
        return "EmployeeDeductions{" +
                "employeeDeductionId=" + employeeDeductionId +
                ", salaryId=" + salaryId +
                ", userId=" + userId +
                ", deductionId=" + deductionId +
                ", deductionAmount=" + deductionAmount +
                '}';
    }
}
