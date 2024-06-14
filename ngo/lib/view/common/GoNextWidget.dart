import 'package:flutter/material.dart';

class GoNextWidget extends StatefulWidget {
  const GoNextWidget({super.key, required this.size});

  final double size;

  @override
  State<GoNextWidget> createState() => _GoBackState();
}

class _GoBackState extends State<GoNextWidget> {
  late double size;

  @override
  void initState() {
    super.initState();
    size = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.arrow_forward,
        size: size,
        color: const Color(0xFF868686),
      ),
    );
  }
}
