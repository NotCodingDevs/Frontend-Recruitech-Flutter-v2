import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/experience.dart';

import 'education.dart';

class Developer {
  int id;
  String firstName;
  String lastName;
  String about;
  String birthDate;
  String gender;
  String backgroundPicture;
  String profilePicture;
  String location;
  List<Experience> experiences;
  List<Education> educations;
  int userId;

  Developer(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.about,
      required this.birthDate,
      required this.gender,
      required this.backgroundPicture,
      required this.profilePicture,
      required this.location,
      required this.userId,
      required this.experiences,
      required this.educations});

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        about: json["about"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        backgroundPicture: json["backgroundPicture"],
        profilePicture: json["profilePicture"],
        location: json["location"]['locationName'],
        userId: json['user']['id'],
        experiences: (json['experiences'] as List)
            .map((e) => Experience.fromJson(e))
            .toList(),
        educations: (json['educations'] as List)
            .map((e) => Education.fromJson(e))
            .toList());
  }

  factory Developer.noArgsConstructor() {
    return Developer(
      id: 0,
      firstName: "",
      lastName: "",
      about: "",
      gender: "",
      backgroundPicture: '',
      profilePicture: '',
      location: "",
      birthDate: "",
      userId: 0,
      experiences: List.empty(),
      educations: List.empty(),
    );
  }
}
