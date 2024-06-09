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
  String? mediaCode;
  String? articleCode;

  TodayNews(
      {this.newsId,
      this.date,
      this.title,
      this.media,
      this.editor,
      this.thumbnail,
      this.summary,
      this.contents,
      this.level,
      this.mediaCode,
      this.articleCode});

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
        level: json['level'],
        mediaCode: json['mediaCode'],
        articleCode: json['articleCode']);
  }
}
