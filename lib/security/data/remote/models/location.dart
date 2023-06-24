class Location {
  int id;
  String city;
  String location;

  Location({
    required this.id,
    required this.city,
    required this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      city: json['name'],
      location: json['locationName'],
    );
  }
}
