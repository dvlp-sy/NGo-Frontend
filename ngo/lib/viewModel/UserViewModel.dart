import 'package:flutter/material.dart';
import 'package:ngo/model/User.dart';
import 'package:ngo/repository/UserRepository.dart';

class UserViewModel extends ChangeNotifier {
  late final UserRepository _userRepository;

  UserDto? userDto;
  bool isLoading = true;
  String? errorMessage;

  UserViewModel(int userId) {
    _userRepository = UserRepository();
    _fetchUser(userId);
  }

  Future<void> _fetchUser(int userId) async {
    try {
      userDto = await _userRepository.fetchUser(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class UserLevelViewModel extends ChangeNotifier {
  late final UserRepository _userRepository;

  UserLevelDto? userLevelDto;
  bool isLoading = true;
  String? errorMessage;

  UserLevelViewModel(int userId, String level) {
    _userRepository = UserRepository();
    updateUserLevel(userId, level);
  }

  Future<void> updateUserLevel(int userId, String level) async {
    try {
      userLevelDto = await _userRepository.updateUserLevel(userId, level);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class LoginPwViewModel extends ChangeNotifier {
  late final UserRepository _userRepository;

  bool isLoading = true;
  String? errorMessage;

  LoginPwViewModel(int userId, String level) {
    _userRepository = UserRepository();
    updateLoginPw(userId, level);
  }

  Future<void> updateLoginPw(int userId, String newPw) async {
    try {
      await _userRepository.updateLoginPw(userId, newPw);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
