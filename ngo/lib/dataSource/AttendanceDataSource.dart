import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngo/model/Attendance.dart';
import 'BaseAddress.dart';

class AttendanceDataSource {
  final String address = BaseAddress.address;

  Future<AllAttendanceDto> fetchRecentAttendance(int userId) async {
    final response = await http
        .get(Uri.parse('$address/api/users/$userId/recentAttendances'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return AllAttendanceDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Recent Attendance Information');
    }
  }

  Future<AllAttendanceDto> fetchAttendances(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/attendances'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return AllAttendanceDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Attendance Information');
    }
  }
}
