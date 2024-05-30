import 'package:flutter/material.dart';
import 'news/NewsScreen.dart';
import 'member/AttendanceScreen.dart';
import 'rank/LeaderBoardScreen.dart';
import 'scrap/ScrapScreen.dart';
import 'MainScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = _MyAppBar();
    Widget startWidget = _buildStartWidget();
    Widget challengeWidget = _buildChallengeWidet();

    return Scaffold(
        appBar: appBar,
        body: Container(
            padding:
                const EdgeInsets.only(left: 35, right: 35, bottom: 30, top: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [startWidget, challengeWidget])));
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xFF7AD8C2),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child:
            const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
              width: 350,
              child: Text('안녕하세요!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          SizedBox(
              width: 350,
              child: Text('오늘도 신문!Go를 방문해주셔서 감사합니다',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 255, 255, 255))))
        ]));
  }

  @override
  Size get preferredSize => const Size(0.0, 135.0);
}

Widget _buildStartWidget() {
  Widget todayNewsWidget = const _TodayNewsWidget();

  return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      width: 350,
      height: 180,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
            width: 350,
            height: 30,
            child: Text('시작하기',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        const SizedBox(
            width: 350,
            height: 30,
            child: Text('버튼을 눌러 \'오늘의 신문\'을 읽어봅시다',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Color(0xFF858585)))),
        todayNewsWidget
      ]));
}

Widget _buildChallengeWidet() {
  Widget challengeWidget = const _ChallengeWidget();
  return challengeWidget;
}

///
/// _TodayNewsWidget, 오늘의 뉴스 위젯
/// 위젯을 눌러 오늘의 뉴스 화면 불러오기
///

class _TodayNewsWidget extends StatefulWidget {
  const _TodayNewsWidget({Key? key}) : super(key: key);

  @override
  State<_TodayNewsWidget> createState() => _TodayNewsState();
}

class _TodayNewsState extends State<_TodayNewsWidget> {
  void _buttonPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewsScreen()));
  }

  @override
  Widget build(BuildContext buildContext) {
    return GestureDetector(
        onTap: () {
          _buttonPressed();
        },
        child: Container(
            width: 350,
            height: 80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(20)),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('오늘의 신문 ',
                      style: TextStyle(
                          color: Color(0xFF868686),
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, size: 18, color: Color(0xFF868686))
                ])));
  }
}

///
/// _ChallengeWidget, 도전과제 위젯
/// 출석 확인하기, 랭킹 확인하기, 스크랩 읽기, 다른 기사 읽기 화면 불러오기
///

class _ChallengeWidget extends StatefulWidget {
  const _ChallengeWidget({super.key});

  @override
  State<_ChallengeWidget> createState() => _ChallengeState();
}

class _ChallengeState extends State<_ChallengeWidget> {
  void _onTap(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(initialIndex: index)));
  }

  void _onTapNews() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        width: 350,
        height: 400,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
              width: 350,
              height: 30,
              child: Text('도전과제',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(
              width: 350,
              height: 30,
              child: Text('로그인 후 이용 가능합니다',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Color(0xFF858585)))),
          SizedBox(
              width: 350,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => _onTap(4),
                        child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward,
                                      size: 18, color: Color(0xFF868686)),
                                  Text('출석 확인하기',
                                      style: TextStyle(
                                          color: Color(0xFF868686),
                                          fontWeight: FontWeight.bold))
                                ]))),
                    GestureDetector(
                        onTap: () => _onTap(1),
                        child: Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward,
                                      size: 18, color: Color(0xFF868686)),
                                  Text('랭킹 확인하기',
                                      style: TextStyle(
                                          color: Color(0xFF868686),
                                          fontWeight: FontWeight.bold))
                                ]))),
                  ])),
          SizedBox(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                GestureDetector(
                    onTap: () => _onTap(2),
                    child: Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_forward,
                                  size: 18, color: Color(0xFF868686)),
                              Text('스크랩 읽기',
                                  style: TextStyle(
                                      color: Color(0xFF868686),
                                      fontWeight: FontWeight.bold))
                            ]))),
                GestureDetector(
                    onTap: () => _onTapNews(),
                    child: Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_forward,
                                  size: 18, color: Color(0xFF868686)),
                              Text('다른 기사 읽기',
                                  style: TextStyle(
                                      color: Color(0xFF868686),
                                      fontWeight: FontWeight.bold))
                            ]))),
              ]))
        ]));
  }
}
