import 'package:flutter/material.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/res/app_url.dart';
import 'package:movies_app/res/colors.dart';
import 'package:movies_app/res/components/red_border_widget.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/view_model/person_detail_view_model.dart';
import 'package:movies_app/views/person_detail/person_image_list.dart';
import 'package:movies_app/views/person_detail/person_movie_list.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';

class PersonDetailScreen extends StatefulWidget {
  final Casts person;

  const PersonDetailScreen({
    super.key,
    required this.person,
  });

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  PersonDetailViewModel personDetailViewModel = PersonDetailViewModel();

  @override
  void initState() {
    personDetailViewModel.fetchPersonListApi(widget.person.id!);
    super.initState();
  }

  @override
  void dispose() {
    personDetailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.person.name!,
              style: AppStyle.instance.h5Bold,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChangeNotifierProvider<PersonDetailViewModel>(
                    create: (BuildContext context) => personDetailViewModel,
                    child: Consumer<PersonDetailViewModel>(builder: (context, value, _) {
                      switch (value.personList.status) {
                        case Status.LOADING:
                          return const Center(child: CircularProgressIndicator());
                        case Status.ERROR:
                          return Text(value.personList.toString());
                        case Status.COMPLETED:
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * .35,
                                  width: double.infinity,
                                  child: Image.network(
                                    "${AppUrl.photoBaseUrl}${value.personList.data!.profilePath}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.personList.data!.name.toString(),
                                        style: AppStyle.instance.h5Bold,
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star_border_outlined,
                                                color: AppColors.redColor,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: width * .01,
                                              ),
                                              Text(
                                                value.personList.data!.popularity!.toString(),
                                                style: AppStyle.instance.bodyXLarge.copyWith(color: AppColors.redColor),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.redColor,
                                                size: 18,
                                              ),
                                              Text(
                                                value.personList.data!.birthday!.toString(),
                                                style: AppStyle.instance.bodyXLarge,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              RedBorderWidget(
                                                  text: value.personList.data!.knownForDepartment.toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      Text(value.personList.data!.biography.toString(),
                                          style: AppStyle.instance.bodyMedium.copyWith(
                                            color: AppColors.whiteColor.withOpacity(0.6),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                )
                              ]);

                        default:
                          return const Text("Hata");
                      }
                    })),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [PersonMovieList(person: widget.person), PersonImageList(person: widget.person)],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
