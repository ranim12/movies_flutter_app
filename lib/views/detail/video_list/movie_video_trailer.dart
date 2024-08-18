import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/models/movies_video.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/components/red_border_widget.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieVideoTrailer extends StatefulWidget {
  final Video video;
  final Results movie;

  const MovieVideoTrailer({super.key, required this.video, required this.movie});

  @override
  State<MovieVideoTrailer> createState() => _MovieVideoTrailerState();
}

class _MovieVideoTrailerState extends State<MovieVideoTrailer> {
  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: widget.video.key!,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          autoPlay: false,
        ),
      );
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.video.key == null
                  ? const Text("Video bulunamadı.")
                  : SizedBox(
                      height: height * .30,
                      width: width * .90,
                      child: YoutubePlayerControllerProvider(
                        // Provides controller to all the widget below it.
                        controller: _controller,
                        child: const YoutubePlayerIFrame(
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
              SizedBox(height: height * .01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * .3,
                    child: Text(
                      widget.video.name!,
                      style: AppStyle.instance.bodyMedium,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RedBorderWidget(text: widget.video.iso31661!),
                      const SizedBox(width: 10),
                      RedBorderWidget(text: widget.video.iso6391!)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Divider(
            color: AppColors.whiteColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
