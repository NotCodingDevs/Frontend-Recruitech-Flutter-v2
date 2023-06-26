class MyFileImage {
  bool success;
  String message;
  String path;

  MyFileImage({
    required this.success,
    required this.message,
    required this.path,
  });

  factory MyFileImage.fromJson(Map<String, dynamic> json) {
    return MyFileImage(
      success: json['success'],
      message: json['message'],
      path: json['path'],
    );
  }

  factory MyFileImage.failure() {
    return MyFileImage(
      success: false,
      message: 'Failure',
      path: '',
    );
  }
}
