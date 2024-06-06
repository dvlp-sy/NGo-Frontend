import 'package:flutter/material.dart';
import 'package:ngo/view/common/ImageWidget.dart';
import '../common/GoBackWidget.dart';
import 'package:provider/provider.dart';
import '../../model/TodayNews.dart';
import '../../viewModel/TodayNewsViewModel.dart';

class TodayNewsView extends StatefulWidget {
  const TodayNewsView({super.key});

  @override
  State<TodayNewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<TodayNewsView> {
  late List<TodayNews> todayNewsList;

  String getImageUrl(List<TodayNews> todayNewsList) {
    if (todayNewsList.isNotEmpty) {
      if (todayNewsList[1].thumbnail != null &&
          todayNewsList[1].thumbnail != "") {
        return todayNewsList[1].thumbnail.toString();
      }
    }
    return "https://static.vecteezy.com/system/resources/previews/022/059/000/large_2x/no-image-available-icon-vector.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _TitleBar(),
        body: Consumer<TodayNewsViewModel>(builder: (context, provider, child) {
          List<TodayNews> todayNewsList = provider.todayNewsList;
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                    margin: const EdgeInsets.all(30),
                    child: ImageWidget(imageUrl: getImageUrl(todayNewsList))),
                Text(todayNewsList.isNotEmpty
                    ? todayNewsList[1].summary ?? ""
                    : "")
              ]));
        }));
  }
}

class _TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const _TitleBar({super.key});

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "정보없음";
  }

  @override
  Widget build(BuildContext context) {
    final todayNewsList =
        Provider.of<TodayNewsViewModel>(context).todayNewsList;

    return Container(
        width: double.infinity,
        height: 600,
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
                  child: const GoBackWidget(size: 24)),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                      todayNewsList.isNotEmpty
                          ? todayNewsList[1].title ?? ""
                          : "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000)))),
              Container(
                  width: 350,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      todayNewsList.isNotEmpty
                          ? todayNewsList[1].date ?? ""
                          : "",
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
                                child: Text(
                                    todayNewsList.isNotEmpty
                                        ? getString(todayNewsList[1].media)
                                        : "정보없음",
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
                                child: Text(
                                    todayNewsList.isNotEmpty
                                        ? getString(todayNewsList[1].editor)
                                        : "정보없음",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000000)))))
                      ]))
            ]));
  }

  @override
  Size get preferredSize => const Size(0.0, 250.0);
}
