import 'package:flutter/material.dart';

class GoBackWidget extends StatefulWidget {
  const GoBackWidget({super.key, required this.size});

  final double size;

  @override
  State<GoBackWidget> createState() => _GoBackState();
}

class _GoBackState extends State<GoBackWidget> {
  late double size;

  @override
  void initState() {
    super.initState();
    size = widget.size;
  }

  void _buttonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _buttonPressed,
      child: Icon(
        Icons.arrow_back,
        size: size,
        color: const Color(0xFF868686),
      ),
    );
  }
}
