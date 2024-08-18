import 'package:flutter/material.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/style/text_style.dart';

class TextSubWidget extends StatelessWidget {
  final String text;

  const TextSubWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: AppStyle.instance.bodyMedium.copyWith(
          color: AppColors.whiteColor.withOpacity(0.9),
        ),
      ),
    );
  }
}
