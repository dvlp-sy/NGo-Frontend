import 'package:flutter/material.dart';
import '../common/GoBackWidget.dart';
import 'package:provider/provider.dart';
import '../../model/TodayNews.dart';
import '../../viewModel/TodayNewsViewModel.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late List<TodayNews> todayNewsList;

  @override
  Widget build(BuildContext context) {
    const appBar = _MyAppBar();

    return Scaffold(
        appBar: appBar,
        body: Consumer<TodayNewsViewModel>(builder: (context, provider, child) {
          todayNewsList = provider.todayNewsList;
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                const GoBackWidget(size: 20),
                Text("${todayNewsList[1].contents}")
              ]));
        }));
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child:
            const Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
              width: 350,
              child: Text("안녕하세요!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000)))),
          SizedBox(
              width: 350,
              child: Text('오늘도 신문!Go를 방문해주셔서 감사합니다',
                  style: TextStyle(fontSize: 14, color: Color(0xFF000000))))
        ]));
  }

  @override
  Size get preferredSize => const Size(0.0, 1000.0);
}
