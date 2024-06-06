import '../model/Scrap.dart';
import '../dataSource/scrapDataSource.dart';

class ScrapRepository {
  final _scrapDataSource = ScrapDataSource();

  Future<ScrapList> getAllScraps(int userId) {
    return _scrapDataSource.getAllScraps(userId);
  }
}
