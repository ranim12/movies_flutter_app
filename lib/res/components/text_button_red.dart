import 'package:flutter/material.dart';
import 'package:movies_app/res/components/text_sub_red_widget.dart';

class TextButtonRed extends StatelessWidget {
  final void Function()? onPress;
  final String text;

  const TextButtonRed({super.key, this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: TextSubRedWidget(
          text: text,
        ));
  }
}
