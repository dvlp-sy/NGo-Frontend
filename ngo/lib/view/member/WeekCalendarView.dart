import 'package:flutter/material.dart';
import 'package:ngo/viewModel/AttendanceViewModel.dart';
import 'package:provider/provider.dart';

class WeekCalendarView extends StatelessWidget {
  const WeekCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllAttendanceViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.errorMessage != null) {
          return Center(child: Text(viewModel.errorMessage!));
        }

        List<int> dateList = viewModel.allAttendanceDto?.attendanceList
                ?.map((attendance) => DateTime.parse(attendance.date!).day)
                .toList() ??
            [];

        final DateTime today = DateTime.now();
        final int todayDay = today.day; // 오늘 날짜

        List<Widget> calendarWidgets = [];

        // 날짜 추가
        for (int day = todayDay - 6; day <= todayDay; day++) {
          bool isSpecialDate = dateList.contains(day);
          calendarWidgets.add(
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSpecialDate
                    ? const Color(0xFF7AD9C2)
                    : const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }

        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: 400,
              height: 50,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 400,
                        height: 50,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 7,
                          childAspectRatio: 1.0,
                          children: calendarWidgets,
                        ))
                  ]))
        ]);
      },
    );
  }
}
