import 'package:movies_app/data/network/base_api_services.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/models/movies_video.dart';
import 'package:movies_app/models/review.dart';
import 'package:movies_app/res/app_url.dart';

class DetailRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Cast> fetchCasts(int movieId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.moviesBaseUrl}/$movieId${AppUrl.cast}");

      return response = Cast.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MoviesVideo> fetchMoviesVideo(int movieId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.moviesBaseUrl}/$movieId${AppUrl.movieVideo}");
      // print(response.body.toString());
      return response = MoviesVideo.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> fetchSimilarMoviesVideo(int movieId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.moviesBaseUrl}/$movieId${AppUrl.similarMovie}");
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Reviews> fetchReviewMovie(int movieId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.moviesBaseUrl}/$movieId${AppUrl.reviewMovie}");
      // print(response.body.toString());
      return response = Reviews.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
