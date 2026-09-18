package service.Admin;

import dao.Admin.AdminAttendanceDao.AdminAttendanceSummary;
import models.Payroll.AdminAttendanceRecord;

import java.time.LocalDate;
import java.util.List;

public interface AdminAttendanceService {
    List<AdminAttendanceRecord> findAttendance(LocalDate fromDate, LocalDate toDate,
                                                Integer departmentId, String status, String sort);

    boolean updateAttendance(Integer attendanceId,
                             LocalDate date,
                             java.time.LocalDateTime checkIn,
                             java.time.LocalDateTime checkOut,
                             java.math.BigDecimal breakHours,
                             Integer late,
                             java.math.BigDecimal productionHours,
                             String status);

    AdminAttendanceSummary getTodaySummary();
}
