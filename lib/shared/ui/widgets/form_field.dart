import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/shared/utils/validator.dart';

import '../theme/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController controller;
  final Validator validator;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator.validateText(value ?? ""),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: hintText,
        hintStyle: CustomTextStyle.inputPlaceHolder,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Color(0xFFF8FAFB),
        prefixIconColor: Color(0xFF8D8D8D),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}
