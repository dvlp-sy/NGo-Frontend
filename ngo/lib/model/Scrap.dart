class Scrap {
  String? title;
  String? link;
  String? media;

  Scrap({this.title, this.link, this.media});

  factory Scrap.fromJson(Map<String, dynamic> json) {
    return Scrap(
        title: json['title'], link: json['link'], media: json['media']);
  }
}

class ScrapList {
  int? userId;
  List<Scrap>? scrapList;

  ScrapList({this.userId, this.scrapList});

  factory ScrapList.fromJson(Map<String, dynamic> json) {
    return ScrapList(userId: json['userId'], scrapList: json['scrapList']);
  }
}
