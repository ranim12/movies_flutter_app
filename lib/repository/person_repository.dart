import 'package:movies_app/data/network/base_api_services.dart';
import 'package:movies_app/data/network/network_api_services.dart';
import 'package:movies_app/models/person.dart';
import 'package:movies_app/models/person_image.dart';
import 'package:movies_app/res/app_url.dart';

import '../models/movies.dart';

class PersonRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Person> fetchPerson(int personId) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse("${AppUrl.personBaseUrl}/$personId${AppUrl.personDetail}");

      return response = Person.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Movies> fetchPersonMovie(int personId) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse("${AppUrl.personBaseUrl}/$personId${AppUrl.movieCredits}");

      return response = Movies.fromPersonMovieJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PersonImage> fetchPersonImage(int personId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.personBaseUrl}/$personId${AppUrl.personImage}");

      return response = PersonImage.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
