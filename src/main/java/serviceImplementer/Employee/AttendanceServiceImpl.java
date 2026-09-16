package serviceImplementer.Employee;

import dao.Employee.AttendanceDao;
import models.Payroll.Attendance;
import service.Employee.AttendanceService;

import java.time.LocalDate;
import java.util.List;

public class AttendanceServiceImpl implements AttendanceService {

    private final AttendanceDao attendanceDao = new AttendanceDao();

    @Override
    public Attendance getTodayAttendance(int userId, LocalDate date) {
        return attendanceDao.getTodayAttendance(userId, date);
    }

    @Override
    public List<Attendance> getAttendanceHistory(int userId, LocalDate fromDate, LocalDate toDate,
                                                  String status, String sort) {
        return attendanceDao.getAttendanceHistory(userId, fromDate, toDate, status, sort);
    }

    @Override
    public AttendanceSummary getSummary(int userId, LocalDate date) {
        return attendanceDao.getSummary(userId, date);
    }

    @Override
    public void checkIn(int userId, LocalDate date) {
        attendanceDao.checkIn(userId, date);
    }

    @Override
    public void lunchIn(int userId, LocalDate date) {
        attendanceDao.lunchIn(userId, date);
    }

    @Override
    public void lunchOut(int userId, LocalDate date) {
        attendanceDao.lunchOut(userId, date);
    }

    @Override
    public void checkOut(int userId, LocalDate date) {
        attendanceDao.checkOut(userId, date);
    }
}
