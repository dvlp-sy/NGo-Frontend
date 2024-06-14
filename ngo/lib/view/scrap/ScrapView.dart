import 'package:flutter/material.dart';
import 'package:ngo/view/scrap/ScrapContentView.dart';
import 'package:ngo/view/scrap/ScrapThumbnailView.dart';
import 'package:ngo/view/scrap/ScrapTitleBarWidget.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

class ScrapView extends StatelessWidget {
  final int scrapId;
  final int userId;

  const ScrapView({super.key, required this.scrapId, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrapTitleBarWidget(userId: userId, scrapId: scrapId),
      body: ScrapWidget(userId: userId, scrapId: scrapId),
    );
  }
}

class ScrapWidget extends StatefulWidget {
  final int initialIndex;
  final int userId;
  final int scrapId;

  const ScrapWidget(
      {super.key,
      this.initialIndex = 0,
      required this.userId,
      required this.scrapId});

  @override
  State<ScrapWidget> createState() => _NewsViewState();
}

class _NewsViewState extends State<ScrapWidget> {
  late ScrapViewModel scrapViewModel;
  late PageController _pageController = PageController();
  late int _selectedIndex;

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

  List<Widget> _initPageList(ScrapViewModel scrapViewModel) {
    List<Widget> pageList = [];
    String contents = getString(scrapViewModel.scrap?.contents);
    List<String> contentList = splitContents(contents);
    pageList.add(ScrapThumbnailView(viewModel: scrapViewModel));
    for (String content in contentList) {
      pageList.add(ScrapContentView(content: content));
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
    scrapViewModel = Provider.of<ScrapViewModel>(context);

    return PageView(
      controller: _pageController,
      children: _initPageList(scrapViewModel),
    );
  }
}
