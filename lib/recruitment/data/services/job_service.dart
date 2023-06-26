import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/job.dart';

class JobService {
  final String JOBS_ENDPOINT = 'http://192.168.241.55:8080/api/v1/jobs';

  Future<List<Job>> fetchAllJobs() async {
    http.Response response = await http.get(
      Uri.parse(JOBS_ENDPOINT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['content'] as List)
          .map((e) => Job.fromJson(e))
          .toList();
    } else {
      throw Exception("Faile to load objets");
    }
  }
}
