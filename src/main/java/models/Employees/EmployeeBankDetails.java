package models.Employees;

public class EmployeeBankDetails {

    private int BankDetailId;
    private String BankName;
    private String AccountNumber;
    private String IFSCCode;
    private String BranchName;
    private int UserId;

    public int getBankDetailId() {
        return BankDetailId;
    }

    public void setBankDetailId(int bankDetailId) {
        BankDetailId = bankDetailId;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String bankName) {
        BankName = bankName;
    }

    public String getAccountNumber() {
        return AccountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        AccountNumber = accountNumber;
    }

    public String getIFSCCode() {
        return IFSCCode;
    }

    public void setIFSCCode(String IFSCCode) {
        this.IFSCCode = IFSCCode;
    }

    public String getBranchName() {
        return BranchName;
    }

    public void setBranchName(String branchName) {
        BranchName = branchName;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }
}