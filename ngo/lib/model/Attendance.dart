class AttendanceDto {
  int? attendanceId;
  String? date;

  AttendanceDto({this.attendanceId, this.date});

  factory AttendanceDto.fromJson(Map<String, dynamic> json) {
    return AttendanceDto(
        attendanceId: json['attendanceId'], date: json['date']);
  }
}

class AllAttendanceDto {
  int? userId;
  List<AttendanceDto>? attendanceList;

  AllAttendanceDto({this.userId, this.attendanceList});

  factory AllAttendanceDto.fromJson(Map<String, dynamic> json) {
    return AllAttendanceDto(
        userId: json['userId'],
        attendanceList: (json['attendanceList'] as List)
            .map((e) => AttendanceDto.fromJson(e))
            .toList());
  }
}
