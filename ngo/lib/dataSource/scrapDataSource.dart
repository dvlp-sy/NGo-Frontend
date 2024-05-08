import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/scrapModel.dart';

class ScrapDataSource {
  String address = 'http://localhost:8080';

  Future<ScrapListDto> getAllScraps(int userId) async {
    final response = await http.get(Uri.parse('$address/user/$userId/scrap'));
    return jsonDecode(response.body)
        .map<ScrapListDto>((json) => ScrapListDto.fromJson(json))
        .toList();
  }
}
