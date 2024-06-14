import 'package:flutter/material.dart';
import 'package:ngo/view/member/CalendarView.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CalendarView(),
    );
  }
}
