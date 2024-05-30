import 'package:flutter/material.dart';
import '../common/GoBackWidget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [GoBackWidget(), Text('오늘의 뉴스')])));
  }
}
