import 'package:flutter/material.dart';
import 'package:ngo/view/common/TitleBarWidget.dart';
import 'package:ngo/view/news/ContentView.dart';
import 'package:ngo/view/news/ThumbnailView.dart';
import '../../model/TodayNews.dart';

class NewsView extends StatefulWidget {
  final int initialIndex;
  final TodayNews todayNews;
  const NewsView({super.key, required this.todayNews, this.initialIndex = 0});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late PageController _pageController = PageController();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  List<Widget> _initPageList(TodayNews todayNews) {
    List<Widget> pageList = [];
    pageList.add(ThumbnailView(todayNews: todayNews));
    pageList.add(ContentView(todayNews: todayNews));
    return pageList;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBarWidget(todayNews: widget.todayNews),
        body: PageView(
          controller: _pageController,
          children: _initPageList(widget.todayNews),
        ));
  }
}
