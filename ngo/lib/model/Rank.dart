class UserRankDto {
  int? userId;
  int? userRank;
  String? userName;

  UserRankDto({this.userId, this.userRank, this.userName});

  UserRankDto.empty();

  factory UserRankDto.fromJson(Map<String, dynamic> json) {
    return UserRankDto(
      userId: json['userId'],
      userRank: json['userRank'],
      userName: json['userName'],
    );
  }
}

class RankDto {
  int? userId;
  int? userRank;
  String? userName;
  List<UserRankDto>? userRankDtoList;

  RankDto({
    this.userId,
    this.userRank,
    this.userName,
    this.userRankDtoList,
  });

  factory RankDto.fromJson(Map<String, dynamic> json) {
    return RankDto(
      userId: json['userId'],
      userRank: json['userRank'],
      userName: json['userName'],
      userRankDtoList: (json['userRankDtoList'] as List)
          .map((e) => UserRankDto.fromJson(e))
          .toList(),
    );
  }
}
