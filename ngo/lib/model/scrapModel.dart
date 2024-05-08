class ScrapDto {
  String? title;
  String? link;
  String? media;

  ScrapDto({this.title, this.link, this.media});

  factory ScrapDto.fromJson(Map<String, dynamic> json) {
    return ScrapDto(
        title: json['title'], link: json['link'], media: json['media']);
  }
}

class ScrapListDto {
  int? userId;
  List<ScrapDto>? scrapDtoList;

  ScrapListDto({this.userId, this.scrapDtoList});

  factory ScrapListDto.fromJson(Map<String, dynamic> json) {
    return ScrapListDto(
        userId: json['userId'], scrapDtoList: json['scrapDtoList']);
  }
}
