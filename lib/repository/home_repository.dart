import 'package:movies_app/data/network/base_api_services.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Movies> getMovie() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesPopularMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> getUpComingMovie() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesUpComingMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> getTopRatedMovie() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesTopRatedMovie);
      // print(response.body.toString());
      return response = Movies.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
