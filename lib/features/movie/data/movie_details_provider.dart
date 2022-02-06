import 'package:get/get.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_details.dart';
import 'package:the_movie_api/shared/network/constants.dart';

abstract class MovieDetailsApiProvider {
  Future<Response<MovieDetails>> getMovieDetails(String movieId);

  Future<Response<MovieCast>> getMovieCast(String movieId);
}

class MovieDetailsApiProviderImp extends GetConnect
    implements MovieDetailsApiProvider {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  @override
  Future<Response<MovieCast>> getMovieCast(String movieId) {
    return get('$movieId/$credits',
        query: {'api_key': apiKey},
        decoder: (response) =>
            MovieCast.fromJson(response as Map<String, dynamic>));
  }

  @override
  Future<Response<MovieDetails>> getMovieDetails(String movieId) {
    return get(movieId,
        query: {'api_key': apiKey},
        decoder: (response) =>
            MovieDetails.fromJson(response as Map<String, dynamic>));
  }
}
