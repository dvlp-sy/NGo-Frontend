import 'dart:convert';

import 'package:ngo/dataSource/BaseAddress.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/model/User.dart';

class UserDataSource {
  final String address = BaseAddress.address;

  Future<UserDto> fetchUser(int userId) async {
    final response = await http.get(Uri.parse('$address/api/users/$userId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return UserDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Fetch User Information');
    }
  }

  Future<UserLevelDto> updateUserLevel(int userId, String level) async {
    final response = await http.patch(
        Uri.parse('$address/api/users/$userId/level'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'level': level}));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return UserLevelDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Update Level');
    }
  }

  Future<void> updateLoginPw(int userId, String newPw) async {
    final response =
        await http.patch(Uri.parse('$address/api/users/$userId/pw'));

    if (response.statusCode != 200) {
      throw Exception('Failed to Update Password');
    }
  }
}
