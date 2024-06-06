import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Scrap.dart';
import 'BaseAddress.dart';

class ScrapDataSource {
  String address = BaseAddress.address;

  Future<ScrapList> getAllScraps(int userId) async {
    final response =
        await http.get(Uri.parse('$address/api/users/$userId/scraps'));
    return jsonDecode(response.body)
        .map<ScrapList>((json) => ScrapList.fromJson(json))
        .toList();
  }
}
