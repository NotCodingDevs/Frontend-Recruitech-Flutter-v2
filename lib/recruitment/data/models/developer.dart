// To parse this JSON data, do
//
//     final developer = developerFromJson(jsonString);

import 'dart:convert';

Developer developerFromJson(String str) => Developer.fromJson(json.decode(str));

String developerToJson(Developer data) => json.encode(data.toJson());

class Developer {
  int id;
  String firstName;
  String lastName;
  String about;
  DateTime birthDate;
  String gender;
  String photoUrl;
  Location location;
  List<dynamic> educations;
  List<dynamic> experiences;

  Developer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.birthDate,
    required this.gender,
    required this.photoUrl,
    required this.location,
    required this.educations,
    required this.experiences,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        about: json["about"],
        birthDate: DateTime.parse(json["birthDate"]),
        gender: json["gender"],
        photoUrl: json["photoUrl"],
        location: Location.fromJson(json["location"]),
        educations: List<dynamic>.from(json["educations"].map((x) => x)),
        experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "about": about,
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "photoUrl": photoUrl,
        "location": location.toJson(),
        "educations": List<dynamic>.from(educations.map((x) => x)),
        "experiences": List<dynamic>.from(experiences.map((x) => x)),
      };
}

class Location {
  int id;
  String name;
  String locationName;

  Location({
    required this.id,
    required this.name,
    required this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        locationName: json["locationName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locationName": locationName,
      };
}
