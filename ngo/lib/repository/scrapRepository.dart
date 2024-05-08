import '../model/scrapModel.dart';
import '../dataSource/scrapDataSource.dart';

class ScrapRepository {
  final _scrapDataSource = ScrapDataSource();

  Future<ScrapListDto> getAllScraps(int userId) {
    return _scrapDataSource.getAllScraps(userId);
  }
}
