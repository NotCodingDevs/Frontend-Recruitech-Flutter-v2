import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/job.dart';
import '../models/job_application.dart';

class JobService {
  final String JOBS_ENDPOINT =
      'https://app-backend-recruitech-230629033501.azurewebsites.net/api/v1/jobs';

  final String JOB_APPLICATIONS_ENDPOINT =
      'https://app-backend-recruitech-230629033501.azurewebsites.net/api/v1/job-applications';

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

  Future<List<Job>> fetchAllFeaturedJobs() async {
    http.Response response = await http.get(
      Uri.parse('$JOBS_ENDPOINT/featured'),
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

  Future<List<Job>> fetchAllRecommendJobs() async {
    http.Response response = await http.get(
      Uri.parse('$JOBS_ENDPOINT/recommended'),
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

  Future<JobApplication> applyToJob(int developerId, int jobId) async {
    http.Response response = await http.post(
      Uri.parse('$JOB_APPLICATIONS_ENDPOINT/$developerId/apply/$jobId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      return JobApplication.fromJson(json.decode(response.body));
    } else {
      throw Exception("Faile to load objets");
    }
  }

  Future<List<JobApplication>> fetchJobsAppliedByDeveloper(
      int developerId) async {
    http.Response response = await http.get(
      Uri.parse('$JOB_APPLICATIONS_ENDPOINT/$developerId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body)['content'] as List)
          .map((e) => JobApplication.fromJson(e))
          .toList();
    } else {
      throw Exception("Faile to load objets");
    }
  }
}
