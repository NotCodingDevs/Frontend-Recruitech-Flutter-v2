import '../../../../security/data/remote/models/location.dart';

class Company {
  int id;
  String name;
  String about;
  String backgroundPicture;
  String profilePicture;
  Location location;

  Company(
      {required this.id,
      required this.name,
      required this.about,
      required this.location,
      required this.backgroundPicture,
      required this.profilePicture});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      backgroundPicture: json["backgroundPicture"],
      profilePicture: json["profilePicture"],
      location: Location.fromJson(json['location']),
    );
  }
}
