import 'package:flutter/material.dart';
import 'package:ngo/model/Rank.dart';
import 'package:ngo/repository/RankRepository.dart';
import 'package:flutter/foundation.dart';

class DayRankViewModel extends ChangeNotifier {
  late final RankRepository _repository;
  RankDto? rankDto;
  bool isLoading = true;
  String? errorMessage;

  DayRankViewModel(int userId) {
    _repository = RankRepository();
    _fetchDailyRank(userId);
  }

  Future<void> _fetchDailyRank(int userId) async {
    try {
      rankDto = await _repository.getDailyRank(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class WeekRankViewModel extends ChangeNotifier {
  late final RankRepository _repository;
  RankDto? rankDto;
  bool isLoading = true;
  String? errorMessage;

  WeekRankViewModel(int userId) {
    _repository = RankRepository();
    _fetchWeeklyRank(userId);
  }

  Future<void> _fetchWeeklyRank(int userId) async {
    try {
      rankDto = await _repository.getWeeklyRank(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
