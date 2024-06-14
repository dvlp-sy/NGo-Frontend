import 'package:flutter/material.dart';
import 'package:ngo/view/login/LoginView.dart';
import 'package:ngo/view/member/AccountView.dart';
import 'package:ngo/view/news/NewsListView.dart';
import 'package:ngo/view/news/ReadingCompleteView.dart';
import 'package:ngo/viewModel/AttendanceViewModel.dart';
import 'package:ngo/viewModel/LoginViewModel.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:ngo/viewModel/UserViewModel.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';
import 'HomeView.dart';
import 'rank/LeaderBoardView.dart';
import 'scrap/ScrapListView.dart';

class MainView extends StatefulWidget {
  final int initialIndex;
  final int atdIdx;
  const MainView({super.key, this.initialIndex = 0, this.atdIdx = 0});

  @override
  State<MainView> createState() => _MainState();
}

class _MainState extends State<MainView> {
  late PageController _pageController = PageController();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    LeaderBoardView(),
    ScrapListView(),
    AccountView(initialIndex: 0),
    ReadingCompleteView(),
    NewsListView(),
    AccountView(initialIndex: 1)
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index, {int atdIdx = 0}) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  MainView(initialIndex: index)));
    } else {
      _pageController.jumpToPage(index);
    }
  }

  void _routeLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) =>
                  AllAttendanceViewModel(loginViewModel.userId ?? 0)),
          ChangeNotifierProvider(
              create: (_) => DayRankViewModel(loginViewModel.userId ?? 0)),
          ChangeNotifierProvider(
              create: (_) => WeekRankViewModel(loginViewModel.userId ?? 0)),
          ChangeNotifierProvider(
              create: (_) => ScrapViewModel(loginViewModel.userId ?? 0, 0)),
          ChangeNotifierProvider(
              create: (_) => ScrapSavingViewModel(
                  loginViewModel.userId ?? 0, "", "", "", "", "")),
          ChangeNotifierProvider(
              create: (_) =>
                  ScrapDeletingViewModel(loginViewModel.userId ?? 0, 0)),
          ChangeNotifierProvider(
              create: (_) => UserViewModel(loginViewModel.userId ?? 0)),
          ChangeNotifierProvider(
              create: (_) => UserLevelViewModel(
                  loginViewModel.userId ?? 0, loginViewModel.level ?? "")),
          ChangeNotifierProvider(
              create: (_) => LoginPwViewModel(loginViewModel.userId ?? 0, "")),
        ],
        child: Scaffold(
            body: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: _widgetOptions),
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
                          onTap: loginViewModel.isLogin
                              ? () => _onTap(1)
                              : () => _routeLoginPage(),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.leaderboard, color: Color(0xFF868686)),
                              Text('리더보드')
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: loginViewModel.isLogin
                              ? () => _onTap(2)
                              : () => _routeLoginPage(),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.bookmark_border,
                                  color: Color(0xFF868686)),
                              Text('스크랩')
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: loginViewModel.isLogin
                              ? () => _onTap(7)
                              : () => _routeLoginPage(),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.person, color: Color(0xFF868686)),
                              Text('계정관리')
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
