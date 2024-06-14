import 'package:flutter/material.dart';
import 'package:ngo/view/common/TitleBarWidget.dart';
import 'package:ngo/view/news/ContentView.dart';
import 'package:ngo/view/news/ThumbnailView.dart';
import 'package:ngo/viewModel/UserViewModel.dart';
import 'package:provider/provider.dart';
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
  late UserViewModel userViewModel;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  String getString(String? value) {
    if (value != null && value != "") {
      return value.toString();
    }
    return "";
  }

  List<String> splitContents(String contents) {
    List<String> sentences = [];
    String currentContent = "";
    int contentLength = 0;

    for (int i = 0; i < contents.length; i++) {
      currentContent += contents[i];
      contentLength++;

      if (contents[i] == '.') {
        if (contentLength > 80) {
          sentences.add(currentContent.substring(0, currentContent.length));
          currentContent = "";
          contentLength = 0;
        }
      }
    }

    if (currentContent.isNotEmpty) {
      sentences.add(currentContent);
    }

    return sentences;
  }

  List<Widget> _initPageList(TodayNews todayNews) {
    List<Widget> pageList = [];
    List<String> contentList = splitContents(getString(todayNews.contents));
    pageList.add(ThumbnailView(todayNews: todayNews));
    for (String content in contentList) {
      pageList.add(ContentView(content: content));
    }
    return pageList;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userViewModel = Provider.of<UserViewModel>(context);
    int userId = userViewModel.userDto?.userId ?? 0;

    return Scaffold(
        appBar: TitleBarWidget(todayNews: widget.todayNews, userId: userId),
        body: PageView(
          controller: _pageController,
          children: _initPageList(widget.todayNews),
        ));
  }
}
