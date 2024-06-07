import 'package:flutter/material.dart';

class ReadingCompleteView extends StatelessWidget {
  const ReadingCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('읽기 완료')])));
  }
}
