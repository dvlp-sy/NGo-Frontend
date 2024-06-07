import 'package:flutter/material.dart';
import 'package:ngo/view/news/NewsView.dart';
import 'package:ngo/view/news/LoadingCompleteView.dart';
import 'package:provider/provider.dart';
import '../../model/TodayNews.dart';
import '../../viewModel/TodayNewsViewModel.dart';

class TodayNewsView extends StatefulWidget {
  final int initialIndex;
  const TodayNewsView({super.key, this.initialIndex = 0});

  @override
  State<TodayNewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<TodayNewsView> {
  late PageController _pageController;
  late int _selectedIndex;
  late List<TodayNews> todayNewsList;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  List<Widget> _initPageList(List<TodayNews> todayNewsList) {
    List<Widget> pageList = [];
    for (TodayNews todayNews in todayNewsList) {
      pageList.add(NewsView(todayNews: todayNews));
    }
    pageList.add(const LoadingCompleteView());
    return pageList;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    todayNewsList = Provider.of<TodayNewsViewModel>(context).todayNewsList;

    return PageView(
        controller: _pageController, children: _initPageList(todayNewsList));
  }
}
