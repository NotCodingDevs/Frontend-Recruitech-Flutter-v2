import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class BodyMedium extends StatelessWidget {
  const BodyMedium({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyle.bodyMedium,
    );
  }
}
