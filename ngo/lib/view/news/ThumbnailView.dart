import 'package:flutter/material.dart';
import 'package:ngo/model/TodayNews.dart';
import 'package:ngo/view/common/ImageWidget.dart';

class ThumbnailView extends StatelessWidget {
  final TodayNews todayNews;
  const ThumbnailView({super.key, required this.todayNews});

  String getString(String? value, String defaultValue) {
    if (value != null && value != "") {
      return value.toString();
    }
    return defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 350,
          margin: const EdgeInsets.all(30),
          child: ImageWidget(
              imageUrl: getString(todayNews.thumbnail,
                  "https://static.vecteezy.com/system/resources/previews/022/059/000/large_2x/no-image-available-icon-vector.jpg"))),
      Container(
          width: 350,
          margin: const EdgeInsets.all(20),
          child: Text(
              getString(todayNews.summary, getString(todayNews.title, ""))))
    ]);
  }
}
