package serviceImplementer.Admin;

import dao.Admin.AdminAttendanceDao;
import dao.Admin.AdminAttendanceDao.AdminAttendanceSummary;
import models.Payroll.AdminAttendanceRecord;
import service.Admin.AdminAttendanceService;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class AdminAttendanceServiceImpl implements AdminAttendanceService {
    private final AdminAttendanceDao dao = new AdminAttendanceDao();

    @Override
    public List<AdminAttendanceRecord> findAttendance(LocalDate fromDate, LocalDate toDate,
                                                       Integer departmentId, String status, String sort) {
        return dao.findAttendance(fromDate, toDate, departmentId, status, sort);
    }

    @Override
    public boolean updateAttendance(Integer attendanceId,
                                    LocalDate date,
                                    LocalDateTime checkIn,
                                    LocalDateTime checkOut,
                                    BigDecimal breakHours,
                                    Integer late,
                                    BigDecimal productionHours,
                                    String status) {
        return dao.updateAttendance(attendanceId, date, checkIn, checkOut, breakHours, late, productionHours, status);
    }

    @Override
    public AdminAttendanceSummary getTodaySummary() {
        return dao.getTodaySummary();
    }
}
