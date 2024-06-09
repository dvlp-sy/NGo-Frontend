import 'package:ngo/dataSource/UserDataSource.dart';
import 'package:ngo/model/User.dart';

class UserRepository {
  late final _userDataSource = UserDataSource();

  Future<UserDto> fetchUser(int userId) {
    return _userDataSource.fetchUser(userId);
  }

  Future<UserLevelDto> updateUserLevel(int userId, String level) {
    return _userDataSource.updateUserLevel(userId, level);
  }

  Future<void> updateLoginPw(int userId, String newPw) {
    return _userDataSource.updateLoginPw(userId, newPw);
  }
}
