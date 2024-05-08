import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = _MyAppBar();
    Widget startWidget = _buildStartWidget();
    Widget challengeWidget = _buildChallengeWidet();

    return Scaffold(
      appBar: appBar,
      body: ListView(
        padding: const EdgeInsets.all(35),
        children: [startWidget, challengeWidget],
      ),
    );
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

  return SizedBox(
      width: 350,
      height: 150,
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
  return SizedBox(
      width: 350,
      height: 500,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
              flex: 1,
              child: Container(
                  width: 160,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)))),
          Flexible(
              flex: 1,
              child: Container(
                  width: 160,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)))),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
              flex: 1,
              child: Container(
                  width: 160,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)))),
          Flexible(
              flex: 1,
              child: Container(
                  width: 160,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)))),
        ])
      ]));
}

class _TodayNewsWidget extends StatefulWidget {
  const _TodayNewsWidget({Key? key}) : super(key: key);

  @override
  State<_TodayNewsWidget> createState() => _TodayNewsState();
}

class _TodayNewsState extends State<_TodayNewsWidget> {
  bool _boolStatus = false;
  Color _bgColor = const Color(0xFFEEEEEE);

  void _buttonPressed() {
    setState(() {
      if (_boolStatus == true) {
        _boolStatus = false;
        _bgColor = const Color(0xFFEEEEEE);
      } else {
        _boolStatus = true;
        _bgColor = const Color(0xFF000000);
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return GestureDetector(
        onTap: () {
          _buttonPressed();
        },
        child: Container(
            width: 350,
            height: 85,
            decoration: BoxDecoration(
                color: _bgColor, borderRadius: BorderRadius.circular(20))));
  }
}
