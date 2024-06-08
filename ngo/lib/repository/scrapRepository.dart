import '../model/Scrap.dart';
import '../dataSource/scrapDataSource.dart';

class ScrapRepository {
  final _scrapDataSource = ScrapDataSource();

  Future<ScrapListDto> getAllScraps(int userId) {
    return _scrapDataSource.getAllScraps(userId);
  }

  Future<Scrap> getScrap(int userId, int scrapId) {
    return _scrapDataSource.getScrap(userId, scrapId);
  }
}
