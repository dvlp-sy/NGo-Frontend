import 'package:flutter/material.dart';
import '../model/TodayNews.dart';
import '../repository/TodayNewsRepository.dart';

class TodayNewsViewModel extends ChangeNotifier {
  late final TodayNewsRepository _todayNewsRepository;
  List<TodayNews> _todayNewsList = List.empty(growable: true);
  List<TodayNews> get todayNewsList => _todayNewsList;

  bool isLoading = true;
  String? errorMessage;

  TodayNewsViewModel() {
    _todayNewsRepository = TodayNewsRepository();
    _getTodayNewsList();
  }

  Future<void> _getTodayNewsList() async {
    try {
      _todayNewsList = await _todayNewsRepository.getTodayNews();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
