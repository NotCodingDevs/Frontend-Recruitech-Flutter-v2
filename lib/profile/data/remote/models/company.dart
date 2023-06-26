import '../../../../security/data/remote/models/location.dart';

class Company {
  int id;
  String name;
  String about;
  Location location;

  Company({
    required this.id,
    required this.name,
    required this.about,
    required this.location,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      location: Location.fromJson(json['location']),
    );
  }
}
