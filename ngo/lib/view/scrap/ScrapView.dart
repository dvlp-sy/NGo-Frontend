import 'package:flutter/material.dart';
import 'package:ngo/view/scrap/ScrapContentView.dart';
import 'package:ngo/view/scrap/ScrapThumbnailView.dart';
import 'package:ngo/view/scrap/ScrapTitleBarWidget.dart';
import 'package:ngo/viewModel/scrapViewModel.dart';
import 'package:provider/provider.dart';

class ScrapView extends StatelessWidget {
  final int scrapId;

  const ScrapView({super.key, required this.scrapId});

  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScrapViewModel>(context);
    final userId = viewModel.userId;

    return ChangeNotifierProvider(
        create: (_) => OneScrapViewModel(userId, scrapId),
        child: Scaffold(
            appBar: ScrapTitleBarWidget(userId: userId, scrapId: scrapId),
            body: ScrapWidget(userId: userId, scrapId: scrapId)));
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
  late OneScrapViewModel viewModel;
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

  List<Widget> _initPageList(OneScrapViewModel viewModel) {
    List<Widget> pageList = [];
    List<String> contentList =
        splitContents(getString(viewModel.scrap!.contents));
    pageList.add(ScrapThumbnailView(viewModel: viewModel));
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
    viewModel = Provider.of<OneScrapViewModel>(context);

    return PageView(
      controller: _pageController,
      children: _initPageList(viewModel),
    );
  }
}
