import 'package:flutter/material.dart';

import '../../../../shared/ui/theme/text_styles.dart';
import '../../../data/remote/models/developer.dart';

class AboutDataDialog extends StatefulWidget {
  const AboutDataDialog({super.key, required this.developer});
  final Developer developer;

  @override
  State<AboutDataDialog> createState() => _AboutDataDialogState();
}

class _AboutDataDialogState extends State<AboutDataDialog> {
  TextEditingController aboutController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    aboutController.text = widget.developer.about;
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
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(aboutController.text);
            },
            child: Text(
              'Save changes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      content: SizedBox(
        width: size.width * 0.7,
        height: size.height * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change About data',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0xFF0C1E38),
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            const Text(
              'Escribe sobre ti mano para que soprendas a las flaquitas reclutadoras uwu',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0xFF0C1E38),
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            TextField(
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              controller: aboutController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Hi, i'm Diego",
                hintStyle: CustomTextStyle.inputPlaceHolder,
                filled: true,
                fillColor: Color(0xFFF8FAFB),
                prefixIconColor: Color(0xFF8D8D8D),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
