import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Scrap.dart';
import 'BaseAddress.dart';

class ScrapDataSource {
  String address = BaseAddress.address;

  Future<ScrapListDto> getAllScraps(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/scraps'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return ScrapListDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Scrap List');
    }
  }

  Future<Scrap> getScrap(int userId, int scrapId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/scraps/$scrapId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return Scrap.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Load Scrap');
    }
  }
}
