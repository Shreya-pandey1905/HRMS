package serviceImplementer.Reports;

import dao.Reports.PayslipReportDao;
import models.Reports.PayslipReport;
import service.Reports.PayslipReportService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class PayslipReportServiceImpl implements PayslipReportService {

    private PayslipReportDao payslipReportDao = new PayslipReportDao();

    @Override
    public List<PayslipReport> getPayslipReport() {
        return payslipReportDao.getAll();
    }

    @Override
    public Map<String, Double> getSummary(List<PayslipReport> payslipList) {

        double totalPaid = 0;
        double highest = 0;
        double lowest = 0;

        for (int i = 0; i < payslipList.size(); i++) {

            double amount = payslipList.get(i).getPaidAmount();

            totalPaid += amount;

            if (i == 0) {
                highest = amount;
                lowest = amount;
            } else if (amount > highest) {
                highest = amount;
            } else if (amount < lowest) {
                lowest = amount;
            }
        }

        Map<String, Double> summary = new LinkedHashMap<>();
        summary.put("totalPayslips", (double) payslipList.size());
        summary.put("totalPaidAmount", totalPaid);
        summary.put("highestPaid", highest);
        summary.put("lowestPaid", lowest);

        return summary;
    }
}
