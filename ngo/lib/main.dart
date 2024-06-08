import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';
import 'package:ngo/viewModel/AttendanceViewModel.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:ngo/viewModel/TodayNewsViewModel.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int userId = 1;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodayNewsViewModel()),
          ChangeNotifierProvider(create: (_) => AllAttendanceViewModel(userId)),
          ChangeNotifierProvider(create: (_) => DayRankViewModel(userId)),
          ChangeNotifierProvider(create: (_) => WeekRankViewModel(userId)),
          ChangeNotifierProvider(create: (_) => ScrapViewModel(userId)),
        ],
        child: const MaterialApp(
          title: '신문고',
          home: MainView(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
