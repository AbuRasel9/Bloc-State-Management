import 'dart:convert';

import 'package:bloc_state_management/model/login_request.dart';
import 'package:http/http.dart';

class AuthRepository {
  Future<Response> loginApi(String url, LoginRequest loginRequest) async {

    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          loginRequest,
        ),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData["error"]);
      }
    } catch (e) {
      throw Exception("Failed to login: $e");
    }
  }
}
