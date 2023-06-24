class User {
  int id;
  String username;
  String email;
  String jwtToken;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.jwtToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      jwtToken: json['token'],
    );
  }
}
