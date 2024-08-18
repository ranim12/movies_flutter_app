import 'package:flutter/material.dart';
import 'package:movies_app/res/constants/string_constants.dart';
import 'package:movies_app/res/style/text_style.dart';
import 'package:movies_app/views/home/popular_movie_list/popular_list_view.dart';
import 'package:movies_app/views/home/top_rated_list/top_rated_list_view.dart';
import 'package:movies_app/views/home/up_coming_list/up_coming_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.instance.textAppName, style: AppStyle.instance.h5Bold),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PopularListView(),
            TopRatedListView(),
            UpComingListView(),
          ],
        ),
      ),
    );
  }
}
