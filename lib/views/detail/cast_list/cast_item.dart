import 'package:flutter/material.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/components/avaible_circle_photo.dart';
import 'package:movies_app/res/components/not_avaible_photo.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/views/person_detail/person_detail_screen.dart';

class CastItem extends StatelessWidget {
  final Casts cast;

  const CastItem({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetailScreen(person: cast)));
      },
      child: Card(
        color: AppColors.blackColor,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            cast.profilePath == null
                ? const NotAvaiblePhoto(
                    height: 100,
                    width: 100,
                  )
                : AvaibleCirclePhoto(
                    imageUrl: cast.profilePath!,
                  ),
            cast.name == null
                ? const Text("N/A")
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width * .05),
                        width: width * .20,
                        child: Column(
                          children: [
                            Text(
                              cast.name!,
                              style: AppStyle.instance.bodyXLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: width * .05),
                          width: width * .20,
                          child: Text(
                            cast.character!.toString(),
                            style: AppStyle.instance.bodyMedium.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.4),
                            ),
                          )),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
