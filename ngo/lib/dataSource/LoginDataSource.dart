import 'dart:convert';

import 'package:ngo/dataSource/BaseAddress.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/model/User.dart';

class LoginDataSource {
  final String address = BaseAddress.address;

  Future<UserDto> login(String loginId, String loginPw) async {
    final response = await http.post(
      Uri.parse('$address/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'loginId': loginId, 'loginPw': loginPw}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return UserDto.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to Login');
    }
  }

  Future<void> logout() async {
    final response = await http.post(Uri.parse('$address/api/users/logout'));

    if (response.statusCode != 200) {
      throw Exception('Failed to Logout');
    }
  }
}
