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

  Future<ScrapSavingDto> saveScrap(int userId, String title, String link,
      String media, String mediaCode, String articleCode) async {
    final response =
        await http.post(Uri.parse('$address/api/users/$userId/scraps'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'title': title,
              'link': link,
              'media': media,
              'mediaCode': mediaCode,
              'articleCode': articleCode
            }));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return ScrapSavingDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Save Scrap');
    }
  }

  Future<void> deleteScrap(int userId, int scrapId) async {
    final response = await http
        .delete(Uri.parse('$address/api/users/$userId/scraps/$scrapId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to Delete Scrap');
    }
  }
}
