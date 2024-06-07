import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngo/model/Rank.dart';
import 'BaseAddress.dart';

class RankDataSource {
  final String address = BaseAddress.address;

  Future<RankDto> fetchDailyRank(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/daily-ranks'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return RankDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Ranking');
    }
  }

  Future<RankDto> fetchWeeklyRank(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/weekly-ranks'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return RankDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Ranking');
    }
  }

/*
  Future<RankDto> getDailyRank(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/daily-ranks'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      final RankDto data = RankDto.fromJson(jsonResponse['data']);
      return data;
    } else {
      throw Exception('Failed to Load Ranking');
    }
  }

  Future<RankDto> getWeeklyRank(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/weekly-ranks'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      final RankDto data = RankDto.fromJson(jsonResponse['data']);
      return data;
    } else {
      throw Exception('Failed to Load Ranking');
    }
  }
}

class UserRankDatasource {
  final String apiUrl;

  UserRankDatasource(this.apiUrl);

  Future<RankDto> fetchUserRankings() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return RankDto.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load rankings');
    }
  }
  */
}
