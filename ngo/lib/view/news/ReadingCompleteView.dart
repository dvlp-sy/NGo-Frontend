import 'package:flutter/material.dart';
import 'package:ngo/view/MainView.dart';
import 'package:ngo/view/member/WeekCalendarView.dart';
import 'package:ngo/view/rank/DayRankView.dart';
import 'package:ngo/viewModel/RankViewModel.dart';
import 'package:provider/provider.dart';

class ReadingCompleteView extends StatelessWidget {
  const ReadingCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    final String date =
        "${dateTime.year.toString()}. ${dateTime.month.toString().padLeft(2, '0')}. ${dateTime.day.toString().padLeft(2, '0')}";

    return MultiProvider(providers: [
      ChangeNotifierProvider<WeekRankViewModel>(
          create: (_) => WeekRankViewModel(1))
    ], child: _TotalView(date: date));
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String date;

  const _MyAppBar({super.key, required this.date});

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
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 350,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(
            width: 350,
            child: Text(
              '오늘의 목표 달성',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 135.0);
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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MainView(initialIndex: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        width: 350,
        height: 150,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                onTap: () => _onTap(1),
                child: Container(
                    width: 110,
                    height: 110,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
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
          ]),
          GestureDetector(
              onTap: () => _onTap(2),
              child: Container(
                  width: 110,
                  height: 110,
                  padding: const EdgeInsets.all(10),
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
              onTap: () => _onTap(0),
              child: Container(
                  width: 110,
                  height: 110,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_forward,
                            size: 18, color: Color(0xFF868686)),
                        Text('홈으로 가기',
                            style: TextStyle(
                                color: Color(0xFF868686),
                                fontWeight: FontWeight.bold))
                      ]))),
        ]));
  }
}

class _TotalView extends StatelessWidget {
  final String date;

  const _TotalView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _MyAppBar(date: date),
        body: Container(
            width: 350,
            margin: const EdgeInsets.all(40),
            child: const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  _AttendanceWidget(),
                  _RankWidget(),
                  _NavigationWidget()
                ]))));
  }
}

class _AttendanceWidget extends StatelessWidget {
  const _AttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 350,
              child: Text("출석 현황",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          SizedBox(
              width: 350,
              child: Text("최근 일주일간 출석 현황입니다.", textAlign: TextAlign.left)),
          WeekCalendarView()
        ]);
  }
}

class _RankWidget extends StatefulWidget {
  const _RankWidget({super.key});

  @override
  State<_RankWidget> createState() => _RankState();
}

class _RankState extends State<_RankWidget> {
  late WeekRankViewModel viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<WeekRankViewModel>(context);

    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 350,
              child: Text("일일 랭킹",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          SizedBox(width: 350, child: DayRankView(height: 120))
        ]);
  }
}

class _NavigationWidget extends StatelessWidget {
  const _NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(
              width: 350,
              child: Text("다른 메뉴",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          _ChallengeWidget()
        ]));
  }
}
