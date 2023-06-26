import 'dart:convert';
import '../models/developer.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  final String DEVELOPER_ENDPOINT =
      'http://192.168.241.55:8080/api/v1/developers';

  Future<dynamic> fetchDeveloperProfileByUserId(int userId) async {
    http.Response response = await http.get(
      Uri.parse('$DEVELOPER_ENDPOINT/$userId/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Developer.fromJson(jsonDecode(response.body));
    } else {
      return Developer.noArgsConstructor();
    }
  }

  Future<void> updateBackgroundPicture(int developerId, String url) async {
    final queryParams = {'url': url};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrL =
        '$DEVELOPER_ENDPOINT/$developerId/background-picture?$queryString';

    await http.patch(
      Uri.parse(requestUrL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> updateProfilePicture(int developerId, String url) async {
    final queryParams = {'url': url};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrL =
        '$DEVELOPER_ENDPOINT/$developerId/profile-picture?$queryString';

    await http.patch(
      Uri.parse(requestUrL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> updateAboutData(int developerId, String about) async {
    await http.patch(
      Uri.parse('$DEVELOPER_ENDPOINT/$developerId/about'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "about": about,
        },
      ),
    );
  }
}
