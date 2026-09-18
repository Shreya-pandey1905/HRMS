package models.Payroll;

import java.math.BigDecimal;

public class EmployeeEarnings {

    private Integer employeeEarningId;
    private Integer salaryId;
    private Integer userId;
    private Integer earningId;
    private BigDecimal earningAmount;

    public Integer getEmployeeEarningId() {
        return employeeEarningId;
    }

    public void setEmployeeEarningId(Integer employeeEarningId) {
        this.employeeEarningId = employeeEarningId;
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

    public Integer getEarningId() {
        return earningId;
    }

    public void setEarningId(Integer earningId) {
        this.earningId = earningId;
    }

    public BigDecimal getEarningAmount() {
        return earningAmount;
    }

    public void setEarningAmount(BigDecimal earningAmount) {
        this.earningAmount = earningAmount;
    }

    @Override
    public String toString() {
        return "EmployeeEarnings{" +
                "employeeEarningId=" + employeeEarningId +
                ", salaryId=" + salaryId +
                ", userId=" + userId +
                ", earningId=" + earningId +
                ", earningAmount=" + earningAmount +
                '}';
    }
}
