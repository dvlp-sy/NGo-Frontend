import 'package:flutter/material.dart';
import 'package:ngo/view/member/AttendanceView.dart';
import 'package:ngo/view/member/MyPageView.dart';
import 'package:ngo/view/rank/WeekRankView.dart';

class AccountView extends StatelessWidget {
  final int initialIndex;

  const AccountView({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return _AccountWidget(initialIndex: initialIndex);
  }
}

class _AccountWidget extends StatefulWidget {
  final int initialIndex;
  const _AccountWidget({this.initialIndex = 0});

  @override
  State<_AccountWidget> createState() => _AccountState();
}

class _AccountState extends State<_AccountWidget> {
  late PageController _pageController;
  late int _selectedIndex;

  FontWeight _attendanceFontWeight = FontWeight.bold;
  FontWeight _myPageFontWeight = FontWeight.normal;
  FontWeight _rankFontWeight = FontWeight.normal;

  static const List<Widget> _widgetOptions = <Widget>[
    AttendanceView(),
    MyPageView(),
    WeekRankView(height: 350)
  ];

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _attendanceFontWeight = FontWeight.bold;
        _myPageFontWeight = FontWeight.normal;
        _rankFontWeight = FontWeight.normal;
      } else if (index == 1) {
        _attendanceFontWeight = FontWeight.normal;
        _myPageFontWeight = FontWeight.bold;
        _rankFontWeight = FontWeight.normal;
      } else {
        _attendanceFontWeight = FontWeight.normal;
        _myPageFontWeight = FontWeight.normal;
        _rankFontWeight = FontWeight.bold;
      }
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    if (_selectedIndex == 0) {
      _attendanceFontWeight = FontWeight.bold;
      _myPageFontWeight = FontWeight.normal;
      _rankFontWeight = FontWeight.normal;
    } else if (_selectedIndex == 1) {
      _attendanceFontWeight = FontWeight.normal;
      _myPageFontWeight = FontWeight.bold;
      _rankFontWeight = FontWeight.normal;
    } else {
      _attendanceFontWeight = FontWeight.normal;
      _myPageFontWeight = FontWeight.normal;
      _rankFontWeight = FontWeight.bold;
    }
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
        backgroundColor: const Color(0xFFEEEEEE),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 700,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _selectButton(0),
                          child: Text(
                            "출석부",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: _attendanceFontWeight,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectButton(1),
                          child: Text(
                            "프로필",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: _myPageFontWeight,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectButton(2),
                          child: Text(
                            "랭킹",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: _rankFontWeight,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 350,
                      height: 510,
                      alignment: Alignment.center,
                      //decoration: BoxDecoration(
                      //    border: Border.all(color: Color(0xFF000000))),
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndex = index;
                            if (index == 0) {
                              _attendanceFontWeight = FontWeight.bold;
                              _myPageFontWeight = FontWeight.normal;
                              _rankFontWeight = FontWeight.normal;
                            } else if (index == 1) {
                              _attendanceFontWeight = FontWeight.normal;
                              _myPageFontWeight = FontWeight.bold;
                              _rankFontWeight = FontWeight.normal;
                            } else {
                              _attendanceFontWeight = FontWeight.normal;
                              _myPageFontWeight = FontWeight.normal;
                              _rankFontWeight = FontWeight.bold;
                            }
                          });
                        },
                        children: _widgetOptions,
                      )),
                ],
              ))
        ]));
  }
}
