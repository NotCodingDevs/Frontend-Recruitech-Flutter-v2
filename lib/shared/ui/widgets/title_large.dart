import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/shared/ui/theme/text_styles.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyle.titleLarge,
    );
  }
}
