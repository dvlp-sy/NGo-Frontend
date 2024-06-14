import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF7AD9C2),
        child: Center(
            child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(text,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF))))));
  }

  @override
  Size get preferredSize => const Size(0.0, 100.0);
}
