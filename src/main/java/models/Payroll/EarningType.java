package models.Payroll;

public class EarningType {

    private Integer earntypeId;
    private String earningName;

    public Integer getEarntypeId() {
        return earntypeId;
    }

    public void setEarntypeId(Integer earntypeId) {
        this.earntypeId = earntypeId;
    }

    public String getEarningName() {
        return earningName;
    }

    public void setEarningName(String earningName) {
        this.earningName = earningName;
    }

    @Override
    public String toString() {
        return "EarningType{" +
                "earntypeId=" + earntypeId +
                ", earningName='" + earningName + '\'' +
                '}';
    }
}
