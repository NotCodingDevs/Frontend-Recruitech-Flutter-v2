import 'dart:convert';

import '../models/location.dart';
import 'package:http/http.dart' as http;

class LocationService {
  final String LOCATION_ENDPOINT =
      "https://spring-app-recruitech.bluewave-aef3079f.eastus.azurecontainerapps.io/api/v1/locations";

  Future<List<Location>> fetchAllLocations() async {
    http.Response response = await http.get(
      Uri.parse(LOCATION_ENDPOINT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List locationsMap = jsonResponse['content'];
      final List<Location> locations =
          locationsMap.map((e) => Location.fromJson(e)).toList();

      return locations;
    } else {
      throw Exception("Faile to load objets");
    }
  }
}
