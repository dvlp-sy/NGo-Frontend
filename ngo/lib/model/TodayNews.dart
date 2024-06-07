class TodayNews {
  int? newsId;
  String? date;
  String? title;
  String? media;
  String? editor;
  String? thumbnail;
  String? summary;
  String? contents;
  String? level;

  TodayNews(
      {this.newsId,
      this.date,
      this.title,
      this.media,
      this.editor,
      this.thumbnail,
      this.summary,
      this.contents,
      this.level});

  TodayNews.empty();

  factory TodayNews.fromJson(Map<String, dynamic> json) {
    return TodayNews(
        newsId: json['newsId'],
        date: json['date'],
        title: json['title'],
        media: json['media'],
        editor: json['editor'],
        thumbnail: json['thumbnail'],
        summary: json['summary'],
        contents: json['contents'],
        level: json['level']);
  }
}

/*
class TodayNewsList {
  List<TodayNews>? newsList;

  TodayNewsList({this.newsList});

  factory TodayNewsList.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<TodayNews> todayNewsList =
        dataList.map((data) => TodayNews.fromJson(data)).toList();

    return TodayNewsList(newsList: todayNewsList);
  }
}
*/
