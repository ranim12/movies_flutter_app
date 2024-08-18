import 'package:flutter/material.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/view_model/detail_view_model.dart';
import 'package:movies_app/views/detail/video_list/movie_video_trailer.dart';
import 'package:provider/provider.dart';

class MovieTrailerListView extends StatefulWidget {
  final Results movie;

  const MovieTrailerListView({super.key, required this.movie});

  @override
  State<MovieTrailerListView> createState() => _MovieTrailerListViewState();
}

class _MovieTrailerListViewState extends State<MovieTrailerListView> {
  DetailViewModel detailViewModel = DetailViewModel();

  @override
  void initState() {
    detailViewModel.fetchVideoListApi(widget.movie.id!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider<DetailViewModel>(
        create: (BuildContext context) => detailViewModel,
        child: Consumer<DetailViewModel>(builder: (context, value, _) {
          switch (value.videoList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Text(value.videoList.toString());
            case Status.COMPLETED:
              return Column(children: [_upVideoList(value, height)]);

            default:
              return const Text("Hata");
          }
        }));
  }

  Widget _upVideoList(DetailViewModel value, double height) {
    return SizedBox(
      height: height - 10,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: value.videoList.data!.results!.length,
          itemBuilder: (context, index) {
            return MovieVideoTrailer(
              video: value.videoList.data!.results![index],
              movie: widget.movie,
            );
          }),
    );
  }
}
