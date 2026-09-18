package service.Reports;

import models.Reports.PayslipReport;

import java.util.List;
import java.util.Map;

public interface PayslipReportService {

    List<PayslipReport> getPayslipReport();

    Map<String, Double> getSummary(List<PayslipReport> payslipList);
}
