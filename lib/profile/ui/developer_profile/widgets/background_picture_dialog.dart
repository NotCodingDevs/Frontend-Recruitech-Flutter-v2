import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/remote/models/developer.dart';
import '../../../data/remote/models/file_image.dart';
import '../../../data/remote/services/file_service.dart';

class BackgroundPictureDialog extends StatefulWidget {
  const BackgroundPictureDialog({super.key, required this.developer});
  final Developer developer;

  @override
  State<BackgroundPictureDialog> createState() =>
      _BackgroundPictureDialogState();
}

class _BackgroundPictureDialogState extends State<BackgroundPictureDialog> {
  File? _backgroundPicture;
  FileService fileService = FileService();

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _backgroundPicture = imageTemporary;
    });
  }

  Future getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _backgroundPicture = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      actions: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              padding: EdgeInsets.symmetric(vertical: 12.0),
              backgroundColor: Color(0xFF2F4897),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () async {
              if (_backgroundPicture != null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Uploading image...'),
                ));

                MyFileImage res =
                    await fileService.uploadFile(_backgroundPicture!);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }

                Navigator.of(context, rootNavigator: true).pop(res.path);
              }
            },
            child: Text(
              'Save changes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
      surfaceTintColor: Colors.white,
      content: Container(
        width: size.width * 0.7,
        height: size.height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change background image',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0xFF0C1E38),
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            const Text(
              "Select an image from gallery or camera",
              style: const TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0xFF0C1E38),
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: SizedBox(
                height: 140.0,
                width: double.infinity,
                child: _backgroundPicture == null
                    ? Image.network(widget.developer.backgroundPicture,
                        fit: BoxFit.cover)
                    : Image.file(
                        File(_backgroundPicture!.path).absolute,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.camera),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF2F4897)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () async {
                      await getImageFromCamera();
                    },
                    label: Text('Camera'),
                  ),
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      backgroundColor: Color(0xFF2F4897),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () async {
                      await getImageFromGallery();
                    },
                    label: Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
