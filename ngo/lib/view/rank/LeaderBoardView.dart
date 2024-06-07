import 'package:flutter/material.dart';
import 'package:ngo/view/common/AppBarWidget.dart';
import 'package:ngo/view/rank/DayRankView.dart';
import 'package:ngo/view/rank/WeekRankView.dart';

class LeaderBoardView extends StatelessWidget {
  final int initialIndex;

  const LeaderBoardView({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return _LeaderBoardWidget(initialIndex: initialIndex);
  }
}

class _LeaderBoardWidget extends StatefulWidget {
  final int initialIndex;
  const _LeaderBoardWidget({super.key, this.initialIndex = 0});

  @override
  State<_LeaderBoardWidget> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<_LeaderBoardWidget> {
  late PageController _pageController;
  late int _selectedIndex;

  FontWeight _dayWeight = FontWeight.bold;
  FontWeight _weekWeight = FontWeight.normal;

  static const List<Widget> _widgetOptions = <Widget>[
    DayRankView(height: 450),
    WeekRankView(height: 450)
  ];

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _dayWeight = FontWeight.bold;
        _weekWeight = FontWeight.normal;
      } else {
        _dayWeight = FontWeight.normal;
        _weekWeight = FontWeight.bold;
      }
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFEEEEEE)))),
            padding: const EdgeInsets.all(15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _selectButton(0);
                      },
                      child: Text("일일 랭킹",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: _dayWeight,
                              color: const Color(0xFF000000)))),
                  GestureDetector(
                      onTap: () {
                        _selectButton(1);
                      },
                      child: Text("주간 랭킹",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: _weekWeight,
                              color: const Color(0xFF000000))))
                ]),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                  if (index == 0) {
                    _dayWeight = FontWeight.bold;
                    _weekWeight = FontWeight.normal;
                  } else {
                    _dayWeight = FontWeight.normal;
                    _weekWeight = FontWeight.bold;
                  }
                });
              },
              children: _widgetOptions,
            ),
          ),
        ],
      ),
    );
  }
}
