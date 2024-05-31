import 'package:flutter/material.dart';
import 'package:ngo/view/member/AttendanceScreen.dart';
import 'package:ngo/view/news/NewsScreen.dart';
import 'HomeScreen.dart';
import 'member/AccountScreen.dart';
import 'rank/LeaderBoardScreen.dart';
import 'scrap/ScrapScreen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MenuState();
}

class _MenuState extends State<MainScreen> {
  late PageController _pageController = PageController();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LeaderBoardScreen(),
    ScrapScreen(),
    AccountScreen(),
    AttendanceScreen(),
    NewsView()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(controller: _pageController, children: _widgetOptions),
        bottomNavigationBar: Container(
            width: 200,
            height: 80,
            margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
            child: Container(
                padding: const EdgeInsets.all(10),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(color: const Color(0xFF7AD8C2)),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _onTap(0),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.home, color: Color(0xFF868686)),
                          Text('홈')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTap(1),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.leaderboard, color: Color(0xFF868686)),
                          Text('리더보드')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTap(2),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.bookmark_border, color: Color(0xFF868686)),
                          Text('스크랩')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onTap(3),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.person, color: Color(0xFF868686)),
                          Text('계정관리')
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
