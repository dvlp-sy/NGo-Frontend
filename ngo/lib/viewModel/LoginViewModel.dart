import 'package:flutter/material.dart';
import 'package:ngo/model/User.dart';
import 'package:ngo/repository/LoginRepository.dart';

class LoginViewModel extends ChangeNotifier {
  late final LoginRepository _loginRepository;

  LoginViewModel() {
    _loginRepository = LoginRepository();
  }

  int? _userId;
  String? _level;
  bool _isLogin = false;
  String? errorMessage;

  int? get userId => _userId;
  String? get level => _level;
  bool get isLogin => _isLogin;

  Future<void> login(String loginId, String loginPw) async {
    try {
      UserDto userDto = await _loginRepository.login(loginId, loginPw);
      _userId = userDto.userId;
      _level = userDto.level;
      _isLogin = true;
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _loginRepository.logout();
      _userId = 0;
      _level = "mid";
      _isLogin = false;
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
