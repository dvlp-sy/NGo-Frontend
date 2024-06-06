import 'package:flutter/material.dart';
import 'package:ngo/model/TodayNews.dart';

class ContentView extends StatelessWidget {
  final TodayNews todayNews;
  const ContentView({super.key, required this.todayNews});

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "내용없음";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        margin: const EdgeInsets.all(30),
        child: Text(getString(todayNews.contents)));
  }
}
