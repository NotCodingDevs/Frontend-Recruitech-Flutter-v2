import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/company.dart';

class Job {
  int id;
  String title;
  String description;
  String skillsDescription;
  String type;
  String renumeration;
  Company company;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.skillsDescription,
    required this.type,
    required this.renumeration,
    required this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      skillsDescription: json['skillsDescription'],
      renumeration: json['remuneration'],
      type: json['type'],
      company: Company.fromJson(
        json['company'],
      ),
    );
  }
}
