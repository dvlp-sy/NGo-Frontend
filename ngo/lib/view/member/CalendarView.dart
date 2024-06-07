import 'package:flutter/material.dart';
import 'package:ngo/viewModel/AttendanceViewModel.dart';
import 'package:provider/provider.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

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
        final List<String> weekdays = [
          'SUN',
          'MON',
          'TUE',
          'WED',
          'THU',
          'FRI',
          'SAT',
        ];

        int daysInMonth =
            DateTime(today.year, today.month + 1, 0).day; // 이번 달의 날짜 수
        int firstWeekdayOfMonth =
            DateTime(today.year, today.month, 1).weekday % 7; // 이번 달 1일의 요일
        List<Widget> calendarWidgets = [];

        // 월 -> 영문 변환
        const List<String> monthNames = [
          'JAN',
          'FEB',
          'MAR',
          'APR',
          'MAY',
          'JUN',
          'JUL',
          'AUG',
          'SEP',
          'OCT',
          'NOV',
          'DEC'
        ];

        // 요일 추가
        for (String weekday in weekdays) {
          calendarWidgets.add(
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(4),
              child: Center(
                child: Text(
                  weekday,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }

        // 첫 줄의 공백 추가
        for (int i = 0; i < firstWeekdayOfMonth; i++) {
          calendarWidgets.add(Container());
        }

        // 날짜 추가
        for (int day = 1; day <= daysInMonth; day++) {
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
              width: 350,
              height: 100,
              margin: const EdgeInsets.only(top: 130, left: 20, right: 20),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${monthNames[today.month - 1]}, ${today.year}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Row(children: [
                            const Icon(Icons.star,
                                size: 20, color: Color(0xFFc8D8D5)),
                            Text(" ${dateList.length} / $daysInMonth",
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC8D8D5)))
                          ])
                        ])
                  ])),
          SizedBox(
              width: 350,
              height: 500,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 7,
                childAspectRatio: 1.0,
                children: calendarWidgets,
              ))
        ]);
      },
    );
  }
}
