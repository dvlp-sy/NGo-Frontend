import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentView extends StatefulWidget {
  final String content;
  const ContentView({super.key, required this.content});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  double _fontSize = 20;
  int _selectedButton = 3;

  final List<Color> _backgroundColorList = [
    const Color(0xFFEEEEEE),
    const Color(0xFFEEEEEE),
    const Color(0xFF7AD9C2),
    const Color(0xFFEEEEEE),
    const Color(0xFFEEEEEE)
  ];
  final List<Color> _fontColorList = [
    const Color(0xFF000000),
    const Color(0xFF000000),
    const Color(0xFFFFFFFF),
    const Color(0xFF000000),
    const Color(0xFF000000)
  ];

  void _selectButton(double size, int buttonNo) {
    setState(() {
      _fontSize = size;
      _selectedButton = buttonNo;

      for (int i = 0; i < 5; i++) {
        if (buttonNo == i) {
          _backgroundColorList[i] = const Color(0xFF7AD9C2);
          _fontColorList[i] = const Color(0xFFFFFFFF);
        } else {
          _backgroundColorList[i] = const Color(0xFFEEEEEE);
          _fontColorList[i] = const Color(0xFF000000);
        }
      }
    });
  }

  Widget _buildFontButtonWidget(double size, int buttonNo) {
    return GestureDetector(
        onTap: () {
          _selectButton(size, buttonNo);
        },
        child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: _backgroundColorList[buttonNo],
                borderRadius: BorderRadius.circular(50)),
            child: Center(child: Text("${buttonNo + 1}"))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          margin: const EdgeInsets.all(40),
          child: Text(widget.content, style: TextStyle(fontSize: _fontSize))),
      Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Text("글자 크기", style: TextStyle(fontSize: 16)),
            _buildFontButtonWidget(16, 0),
            _buildFontButtonWidget(18, 1),
            _buildFontButtonWidget(20, 2),
            _buildFontButtonWidget(21, 3),
            _buildFontButtonWidget(22, 4)
          ]))
    ]);
  }
}
