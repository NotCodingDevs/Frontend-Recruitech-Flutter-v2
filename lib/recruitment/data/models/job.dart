import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/company.dart';

class Job {
  int id;
  String title;
  String description;
  String type;
  Company company;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      company: Company.fromJson(
        json['company'],
      ),
    );
  }
}
