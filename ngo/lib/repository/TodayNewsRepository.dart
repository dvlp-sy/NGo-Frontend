import '../model/TodayNews.dart';
import '../dataSource/TodayNewsDataSource.dart';

class TodayNewsRepository {
  final _todayNewsDataSource = TodayNewsDataSource();

  Future<List<TodayNews>> getTodayNews() {
    return _todayNewsDataSource.getTodayNews();
  }
}
