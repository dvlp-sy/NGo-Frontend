import 'package:flutter/material.dart';
import '../model/Scrap.dart';
import '../repository/ScrapRepository.dart';

class ScrapViewModel with ChangeNotifier {
  late final ScrapRepository _scrapRepository;
  late ScrapList _scrapListDto;
  ScrapList get scrapListDto => _scrapListDto;

  ScrapViewModel(int userId) {
    _scrapRepository = ScrapRepository();
    _getAllScraps(userId);
  }

  Future<void> _getAllScraps(int userId) async {
    _scrapListDto = await _scrapRepository.getAllScraps(userId);
    notifyListeners();
  }
}
