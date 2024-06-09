class Scrap {
  String? title;
  String? contents;
  String? media;
  String? editor;
  String? summary;
  String? thumbnail;

  Scrap(
      {this.title,
      this.contents,
      this.media,
      this.editor,
      this.summary,
      this.thumbnail});

  factory Scrap.fromJson(Map<String, dynamic> json) {
    return Scrap(
        title: json['title'],
        contents: json['contents'],
        media: json['media'],
        editor: json['editor'],
        summary: json['summary'],
        thumbnail: json['thumbnail']);
  }
}

class ScrapDto {
  int? scrapId;
  String? title;
  String? media;

  ScrapDto({this.scrapId, this.title, this.media});

  factory ScrapDto.fromJson(Map<String, dynamic> json) {
    return ScrapDto(
        scrapId: json['scrapId'], title: json['title'], media: json['media']);
  }
}

class ScrapListDto {
  int? userId;
  List<ScrapDto>? scrapDtoList;

  ScrapListDto({this.userId, this.scrapDtoList});

  factory ScrapListDto.fromJson(Map<String, dynamic> json) {
    return ScrapListDto(
        userId: json['userId'],
        scrapDtoList: (json['scrapDtoList'] as List)
            .map((e) => ScrapDto.fromJson(e))
            .toList());
  }
}

class ScrapSavingDto {
  String? title;
  String? link;
  String? media;
  String? mediaCode;
  String? articleCode;

  ScrapSavingDto(
      {this.title, this.link, this.media, this.mediaCode, this.articleCode});

  factory ScrapSavingDto.fromJson(Map<String, dynamic> json) {
    return ScrapSavingDto(
        title: json['title'],
        link: json['link'],
        media: json['media'],
        mediaCode: json['mediaCode'],
        articleCode: json['articleCode']);
  }
}
