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

  Future<ScrapSavingDto> saveScrap(int userId, String title, String link,
      String media, String mediaCode, String articleCode) {
    return _scrapDataSource.saveScrap(
        userId, title, link, media, mediaCode, articleCode);
  }

  Future<void> deleteScrap(int userId, int scrapId) {
    return _scrapDataSource.deleteScrap(userId, scrapId);
  }
}
