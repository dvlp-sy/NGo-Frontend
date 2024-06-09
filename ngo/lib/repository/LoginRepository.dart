import 'package:ngo/dataSource/LoginDataSource.dart';
import 'package:ngo/model/User.dart';

class LoginRepository {
  late final _loginDataSource = LoginDataSource();

  Future<UserDto> login(String loginId, String loginPw) {
    return _loginDataSource.login(loginId, loginPw);
  }

  Future<void> logout() {
    return _loginDataSource.logout();
  }
}
