import 'package:flutter/material.dart';
import '../model/Scrap.dart';
import '../repository/ScrapRepository.dart';

class ScrapViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;
  late int userId;
  ScrapListDto? scrapListDto;
  bool isLoading = true;
  String? errorMessage;

  ScrapViewModel(int id) {
    userId = id;
    _scrapRepository = ScrapRepository();
    _getAllScraps(id);
  }

  Future<void> _getAllScraps(int userId) async {
    try {
      scrapListDto = await _scrapRepository.getAllScraps(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class OneScrapViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;
  Scrap? scrap;
  bool isLoading = true;
  String? errorMessage;

  OneScrapViewModel(int userId, int scrapId) {
    _scrapRepository = ScrapRepository();
    _getScrap(userId, scrapId);
  }

  Future<void> _getScrap(int userId, int scrapId) async {
    try {
      scrap = await _scrapRepository.getScrap(userId, scrapId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
