import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/components/avaible_poster_path.dart';
import 'package:movies_app/res/components/not_avaible_photo.dart';
import 'package:movies_app/views/detail/detail_screen.dart';

class ListItem extends StatelessWidget {
  final Results movies;

  const ListItem({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movies: movies)));
      },
      child: Column(
        children: [
          Stack(children: [
            movies.posterPath!.isEmpty
                ? const NotAvaiblePhoto(
                    height: 20,
                    width: 20,
                  )
                : AvaiblePosterPath(height: height, width: width, imageUrl: movies.posterPath!),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                height: height * .04,
                width: width * .10,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  "${movies.voteAverage!.roundToDouble()}",
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                  ),
                )),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
