// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/res/app_url.dart';

class AvaiblePosterPath extends StatelessWidget {
  const AvaiblePosterPath({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
  });

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        height: height * .35,
        width: width * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: "${AppUrl.photoBaseUrl}$imageUrl",
    );
  }
}
