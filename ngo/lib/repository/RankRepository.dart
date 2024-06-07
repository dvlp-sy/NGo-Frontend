import 'package:ngo/dataSource/RankDataSource.dart';
import 'package:ngo/model/Rank.dart';

class RankRepository {
  final _rankDataSource = RankDataSource();

  Future<RankDto> getDailyRank(int userId) {
    return _rankDataSource.fetchDailyRank(userId);
  }

  Future<RankDto> getWeeklyRank(int userId) {
    return _rankDataSource.fetchWeeklyRank(userId);
  }
}
