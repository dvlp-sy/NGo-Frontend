import 'package:ngo/dataSource/AttendanceDataSource.dart';
import 'package:ngo/model/Attendance.dart';

class AttendanceRepository {
  final _attendanceDataSource = AttendanceDataSource();

  Future<AllAttendanceDto> getRecentAttendance(int userId) {
    return _attendanceDataSource.fetchRecentAttendance(userId);
  }

  Future<AllAttendanceDto> getAttendances(int userId) {
    return _attendanceDataSource.fetchRecentAttendance(userId);
  }
}
