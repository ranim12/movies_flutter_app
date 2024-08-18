import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/response/api_response.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/models/movies_video.dart';
import 'package:movies_app/models/review.dart';
import 'package:movies_app/repository/detail_repository.dart';

import '../models/movies.dart';

class DetailViewModel with ChangeNotifier {
  final _castRepo = DetailRepository();
  final _videoRepo = DetailRepository();
  final _similarMovieRepo = DetailRepository();
  final _reviewMovieRepo = DetailRepository();

  ApiResponse<Cast> castList = ApiResponse.loading();

  ApiResponse<MoviesVideo> videoList = ApiResponse.loading();

  ApiResponse<Movies> similarMovieList = ApiResponse.loading();

  ApiResponse<Reviews> reviewMovie = ApiResponse.loading();

  setCastList(ApiResponse<Cast> response) {
    castList = response;
    notifyListeners();
  }

  setVideoList(ApiResponse<MoviesVideo> response) {
    videoList = response;
    notifyListeners();
  }

  setSimilarList(ApiResponse<Movies> response) {
    similarMovieList = response;
    notifyListeners();
  }

  setReviewList(ApiResponse<Reviews> response) {
    reviewMovie = response;
    notifyListeners();
  }

  Future<void> fetchCastListApi(int movieId) async {
    await _castRepo.fetchCasts(movieId).then((value) {
      setCastList(ApiResponse.completed(value as Cast?));
    }).onError((error, stackTrace) => setCastList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchVideoListApi(int movieId) async {
    await _videoRepo.fetchMoviesVideo(movieId).then((value) {
      setVideoList(ApiResponse.completed(value as MoviesVideo?));
    }).onError((error, stackTrace) => setVideoList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchSimilarMovieListApi(int movieId) async {
    await _similarMovieRepo.fetchSimilarMoviesVideo(movieId).then((value) {
      setSimilarList(ApiResponse.completed(value as Movies?));
    }).onError((error, stackTrace) => setSimilarList(ApiResponse.error(error.toString())));
  }

  Future<void> fetchReviews(int movieId) async {
    await _reviewMovieRepo.fetchReviewMovie(movieId).then((value) {
      setReviewList(ApiResponse.completed(value as Reviews?));
    }).onError((error, stackTrace) => setReviewList(ApiResponse.error(error.toString())));
  }
}
