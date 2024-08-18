import 'package:flutter/material.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/view_model/detail_view_model.dart';
import 'package:movies_app/views/detail/review_list/review_list_item.dart';
import 'package:provider/provider.dart';

class ReviewListView extends StatefulWidget {
  final Results movie;

  const ReviewListView({super.key, required this.movie});

  @override
  State<ReviewListView> createState() => _ReviewListViewState();
}

class _ReviewListViewState extends State<ReviewListView> {
  DetailViewModel detailViewModel = DetailViewModel();

  @override
  void initState() {
    detailViewModel.fetchReviews(widget.movie.id!);
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
    return ChangeNotifierProvider<DetailViewModel>(
        create: (BuildContext context) => detailViewModel,
        child: Consumer<DetailViewModel>(builder: (context, value, _) {
          switch (value.reviewMovie.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Text(value.reviewMovie.toString());
            case Status.COMPLETED:
              return Column(children: [_upReviewMovieList(height, value)]);
            default:
              return const Text("Hata");
          }
        }));
  }

  Widget _upReviewMovieList(double height, DetailViewModel value) {
    return SizedBox(
      height: height - 10,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: value.reviewMovie.data!.results!.length,
          itemBuilder: (context, index) {
            return value.reviewMovie.data!.results!.isEmpty
                ? Text(
                    "Henüz yorum yok",
                    style: AppStyle.instance.bodyMedium.copyWith(color: AppColors.whiteColor.withOpacity(0.4)),
                  )
                : ReviewItem(review: value.reviewMovie.data!.results![index]);
          }),
    );
  }
}
