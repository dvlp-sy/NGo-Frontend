import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngo/model/TodayNews.dart';
import 'BaseAddress.dart';

class TodayNewsDataSource {
  String address = BaseAddress.address;

  Future<List<TodayNews>> getTodayNews() async {
    final response =
        await http.get(Uri.parse('$address/api/today-news?level=mid'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> data = jsonResponse['data'];

      return data.map<TodayNews>((json) => TodayNews.fromJson(json)).toList();
    } else {
      throw Exception('Failed to Load Today\'s News');
    }
  }
}
