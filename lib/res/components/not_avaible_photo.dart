// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:movies_app/res/colors.dart';

class NotAvaiblePhoto extends StatelessWidget {
  final double height;
  final double width;

  const NotAvaiblePhoto({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.redColor),
      child: const Center(child: const Text("N/A")),
    );
  }
}
