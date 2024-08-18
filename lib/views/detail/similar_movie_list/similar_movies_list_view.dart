import 'package:flutter/material.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/view_model/detail_view_model.dart';
import 'package:movies_app/views/home/up_coming_list/movie_list_item.dart';
import 'package:provider/provider.dart';
import '../../../models/movies.dart';

class SimilarMovieListView extends StatefulWidget {
  final Results movie;

  const SimilarMovieListView({super.key, required this.movie});

  @override
  State<SimilarMovieListView> createState() => _SimilarMovieListViewState();
}

class _SimilarMovieListViewState extends State<SimilarMovieListView> {
  DetailViewModel detailViewModel = DetailViewModel();

  @override
  void initState() {
    detailViewModel.fetchSimilarMovieListApi(widget.movie.id!);
    super.initState();
  }

  @override
  void dispose() {
    detailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChangeNotifierProvider<DetailViewModel>(
                create: (BuildContext context) => detailViewModel,
                child: Consumer<DetailViewModel>(builder: (context, value, _) {
                  switch (value.similarMovieList.status) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Text(value.similarMovieList.toString());
                    case Status.COMPLETED:
                      return Column(children: [_upSimilarMovieList(height, value)]);
                    default:
                      return const Text("Hata");
                  }
                })),
          ],
        ),
      ),
    );
  }

  Widget _upSimilarMovieList(double height, DetailViewModel value) {
    return SizedBox(
      height: height - 10,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 2 / 3.7,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: value.similarMovieList.data!.results!.length,
          itemBuilder: (context, index) {
            return ListItem(movies: value.similarMovieList.data!.results![index]);
          }),
    );
  }
}

class HomeListTittleWidget extends StatelessWidget {
  final String text;

  const HomeListTittleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style: AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
