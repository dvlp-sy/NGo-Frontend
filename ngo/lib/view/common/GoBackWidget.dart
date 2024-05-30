import 'package:flutter/material.dart';

class GoBackWidget extends StatefulWidget {
  const GoBackWidget({super.key});

  @override
  State<GoBackWidget> createState() => _GoBackState();
}

class _GoBackState extends State<GoBackWidget> {
  void _buttonPressed() {
    Navigator.pop(context);
  }

  Widget build(BuildContext buildContext) {
    return GestureDetector(
        onTap: () => _buttonPressed(), child: Icon(Icons.arrow_back));
  }
}
