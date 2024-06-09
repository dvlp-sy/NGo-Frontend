import 'package:flutter/material.dart';
import 'package:ngo/view/common/GoBackWidget.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';
import '../../model/TodayNews.dart';

class TitleBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TodayNews todayNews;
  final int userId;
  const TitleBarWidget(
      {super.key, required this.todayNews, required this.userId});

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "정보없음";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 60),
                  alignment: Alignment.centerLeft,
                  child: const Row(children: [
                    GoBackWidget(size: 24),
                  ])),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(getString(todayNews.title),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000)))),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(getString(todayNews.date),
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xFF000000)))),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF7AD9C2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(getString(todayNews.media),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF))))),
                        Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(getString(todayNews.editor),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000))))),
                        ScrapButton(todayNews: todayNews, userId: userId)
                      ]))
            ]));
  }

  @override
  Size get preferredSize => const Size(0.0, 280.0);
}

class ScrapButton extends StatefulWidget {
  final bool isSaved;
  final int userId;
  final TodayNews todayNews;
  const ScrapButton(
      {super.key,
      required this.userId,
      required this.todayNews,
      this.isSaved = false});

  @override
  State<ScrapButton> createState() => ScrapButtonState();
}

class ScrapButtonState extends State<ScrapButton> {
  late bool _isSaved;
  late ScrapViewModel scrapViewModel;
  late ScrapSavingViewModel scrapSavingViewModel;

  Icon _scrapIcon = const Icon(Icons.bookmark_border, size: 30);

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "";
  }

  void _selectButton() {
    setState(() {
      TodayNews news = widget.todayNews;
      if (_isSaved == false) {
        scrapSavingViewModel.saveScrap(
            widget.userId,
            getString(news.title),
            "https://n.news.naver.com/mnews/article/${getString(news.mediaCode)}/${getString(news.articleCode)}",
            getString(news.media),
            getString(news.mediaCode),
            getString(news.articleCode));

        _isSaved = true;
        _scrapIcon = const Icon(Icons.bookmark_added, size: 30);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    scrapSavingViewModel = Provider.of<ScrapSavingViewModel>(context);

    return GestureDetector(
        onTap: () => _selectButton(),
        child: Container(
            width: 100, alignment: Alignment.centerRight, child: _scrapIcon));
  }
}
