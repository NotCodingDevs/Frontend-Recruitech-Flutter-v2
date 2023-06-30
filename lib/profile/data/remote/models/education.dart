import 'company.dart';

class Education {
  int id;
  String title;
  Company company;

  Education({required this.id, required this.title, required this.company});

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'],
      title: json['title'],
      company: Company.fromJson(json['company']),
    );
  }
}
