import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  final String AUTH_ENDPOINT =
      "https://app-backend-recruitech-230629033501.azurewebsites.net/api/v1/auth";

  Future<dynamic> loginUser(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse('$AUTH_ENDPOINT/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      return User(id: 0, username: "", email: "", jwtToken: "");
    }
  }

  Future<dynamic> registerUser(
    Map<String, dynamic>? data,
  ) async {
    http.Response response = await http.post(
      Uri.parse('$AUTH_ENDPOINT/developer/sign-up'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return "success";
    } else {
      return "error";
    }
  }
}
