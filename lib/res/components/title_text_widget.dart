import 'package:flutter/material.dart';
import 'package:movies_app/res/style/text_style.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;

  const TitleWidget({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: AppStyle.instance.h4Bold,
    );
  }
}
