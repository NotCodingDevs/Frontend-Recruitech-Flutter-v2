import 'company.dart';

class Experience {
  String title;
  String description;
  Company company;

  Experience({
    required this.title,
    required this.description,
    required this.company,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      description: json['description'],
      company: Company.fromJson(json['company']),
    );
  }
}
