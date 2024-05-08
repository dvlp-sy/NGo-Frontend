import 'package:flutter/material.dart';
import '../model/scrapModel.dart';
import '../repository/scrapRepository.dart';

class ScrapViewModel with ChangeNotifier {
  late final ScrapRepository _scrapRepository;
  late ScrapListDto _scrapListDto;
  ScrapListDto get scrapListDto => _scrapListDto;

  ScrapViewModel(int userId) {
    _scrapRepository = ScrapRepository();
    _getAllScraps(userId);
  }

  Future<void> _getAllScraps(int userId) async {
    _scrapListDto = await _scrapRepository.getAllScraps(userId);
    notifyListeners();
  }
}
