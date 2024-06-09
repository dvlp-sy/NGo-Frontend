class UserDto {
  int? userId;
  String? userName;
  String? email;
  String? level;
  String? profileImage;

  UserDto(
      {this.userId, this.userName, this.email, this.level, this.profileImage});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
        userId: json['userId'],
        userName: json['userName'],
        email: json['email'],
        level: json['level'],
        profileImage: json['profileImage']);
  }
}

class UserLevelDto {
  String? level;

  UserLevelDto({this.level});

  factory UserLevelDto.fromJson(Map<String, dynamic> json) {
    return UserLevelDto(level: json['level']);
  }
}
