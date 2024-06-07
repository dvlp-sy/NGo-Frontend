import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(20),
        color: const Color(0xFF7AD9C2),
        child: Center(
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: const Text("랭킹",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF))))));
  }

  @override
  Size get preferredSize => const Size(0.0, 100.0);
}
