import 'package:flutter/material.dart';
import 'package:ngo/model/Attendance.dart';
import 'package:ngo/repository/AttendanceRepository.dart';
import 'package:flutter/foundation.dart';

class RecentAttendanceViewModel extends ChangeNotifier {
  late final AttendanceRepository _repository;
  AllAttendanceDto? allAttendanceDto;
  bool isLoading = true;
  String? errorMessage;

  RecentAttendanceViewModel(int userId) {
    _repository = AttendanceRepository();
    _fetchAttendances(userId);
  }

  Future<void> _fetchAttendances(int userId) async {
    try {
      allAttendanceDto = await _repository.getRecentAttendance(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class AllAttendanceViewModel extends ChangeNotifier {
  late final AttendanceRepository _repository;
  AllAttendanceDto? allAttendanceDto;
  bool isLoading = true;
  String? errorMessage;

  AllAttendanceViewModel(int userId) {
    _repository = AttendanceRepository();
    _fetchAttendances(userId);
  }

  Future<void> _fetchAttendances(int userId) async {
    try {
      allAttendanceDto = await _repository.getAttendances(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
