import 'package:flutter/material.dart';
import 'package:movies_app/data/response/status.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/view_model/home_view_model.dart';
import 'package:movies_app/views/home/up_coming_list/movie_list_item.dart';
import 'package:provider/provider.dart';


class UpComingListView extends StatefulWidget {
  const UpComingListView({super.key});

  @override
  State<UpComingListView> createState() =>
      _UpComingListViewState();
}

class _UpComingListViewState
    extends State<UpComingListView> {
  HomeViewViewModel homeViewViewModel =
      HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchUpComingListApi();
    super.initState();
  }

  @override
  void dispose() {
    homeViewViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          ChangeNotifierProvider<
                  HomeViewViewModel>(
              create: (BuildContext context) =>
                  homeViewViewModel,
              child: Consumer<HomeViewViewModel>(
                  builder: (context, value, _) {
                switch (
                    value.upComingList.status) {
                  case Status.LOADING:
                    return  SizedBox(
                        height: height,
                        child: const Center(
                            child:
                                 CircularProgressIndicator()),
                      );
                  case Status.ERROR:
                    return Text(value.upComingList
                        .toString());
                  case Status.COMPLETED:
                    return Column(children: [
                      const HomeListTittleWidget(
                          text:
                              "Upcoming Film List"),
                      SizedBox(
                        height: height * .02,
                      ),
                      _upComingMovieList(
                          height, value)
                    ]);
                  default:
                    return const Text("Hata");
                }
              })),
        ],
      ),
    );
  }

  SizedBox _upComingMovieList(
      double height, HomeViewViewModel value) {
    return SizedBox(
      height: height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value
              .upComingList.data!.results!.length,
          itemBuilder: (context, index) {
            return ListItem(
                movies: value.upComingList.data!
                    .results![index]);
          }),
    );
  }
}

class HomeListTittleWidget
    extends StatelessWidget {
  final String text;
  const HomeListTittleWidget(
      {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style:
                AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
