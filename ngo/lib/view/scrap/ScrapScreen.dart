import 'package:flutter/material.dart';

class ScrapScreen extends StatelessWidget {
  const ScrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('스크랩')])));
  }
}
