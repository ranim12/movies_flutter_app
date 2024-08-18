// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/res/app_url.dart';

class AvaibleCirclePhoto extends StatelessWidget {
  final String imageUrl;

  const AvaibleCirclePhoto({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(right: 10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: "${AppUrl.photoBaseUrl}$imageUrl",
    );
  }
}
