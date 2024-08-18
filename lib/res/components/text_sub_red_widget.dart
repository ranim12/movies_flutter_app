import 'package:flutter/material.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/style/text_style.dart';

class TextSubRedWidget extends StatelessWidget {
  final String text;

  const TextSubRedWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppStyle.instance.bodyMedium.copyWith(
          color: AppColors.redColor.withOpacity(0.8),
        ));
  }
}
