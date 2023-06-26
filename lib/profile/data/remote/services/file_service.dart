import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/file_image.dart';
import 'package:http_parser/http_parser.dart';

class FileService {
  static const String FILE_ENDPOINT =
      "http://192.168.241.55:8080/api/v1/files/images/upload";

  Future<dynamic> uploadFile(File image) async {
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        contentType: MediaType.parse('image/png'),
      )
    });

    final response = await Dio().post(FILE_ENDPOINT, data: formData);

    if (response.statusCode == 200) {
      return MyFileImage.fromJson(response.data);
    } else {
      return MyFileImage.failure();
    }
  }
}
