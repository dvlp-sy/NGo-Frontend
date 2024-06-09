import 'package:flutter/material.dart';
import '../model/Scrap.dart';
import '../repository/ScrapRepository.dart';

class ScrapListViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;
  late int userId;
  ScrapListDto? scrapListDto;
  bool isLoading = true;
  String? errorMessage;

  ScrapListViewModel(int id) {
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

class ScrapViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;

  Scrap? scrap;
  bool isLoading = true;
  String? errorMessage;

  ScrapViewModel(int userId, int scrapId) {
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

class ScrapSavingViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;

  ScrapSavingDto? scrapDto;
  bool isLoading = true;
  String? errorMessage;

  ScrapSavingViewModel(int userId, String title, String link, String media,
      String mediaCode, String articleCode) {
    _scrapRepository = ScrapRepository();
    saveScrap(userId, title, link, media, mediaCode, articleCode);
  }

  Future<void> saveScrap(int userId, String title, String link, String media,
      String mediaCode, String articleCode) async {
    try {
      scrapDto = await _scrapRepository.saveScrap(
          userId, title, link, media, mediaCode, articleCode);

      print("성공");
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class ScrapDeletingViewModel extends ChangeNotifier {
  late final ScrapRepository _scrapRepository;

  bool isLoading = true;
  String? errorMessage;

  ScrapDeletingViewModel(int userId, int scrapId) {
    _scrapRepository = ScrapRepository();
    deleteScrap(userId, scrapId);
  }

  Future<void> deleteScrap(int userId, int scrapId) async {
    try {
      await _scrapRepository.deleteScrap(userId, scrapId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
