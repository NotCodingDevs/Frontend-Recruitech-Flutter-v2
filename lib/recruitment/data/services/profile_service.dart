import 'dart:convert';
import '../models/developer.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  final String _baseUrl =
      'https://spring-app-recruitech.bluewave-aef3079f.eastus.azurecontainerapps.io/api/v1/developers/';

  Future<dynamic> fetchDeveloperById(int id) async {
    final response = await http.get(
      Uri.parse(_baseUrl + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    try {
      if (response.statusCode == 200) {
        return Developer.fromJson(jsonDecode(response.body));
      } else {
        return {
          'success': false,
          'status': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'status': 500,
      };
    }
  }
}
