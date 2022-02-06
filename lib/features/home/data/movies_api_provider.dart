import 'package:get/get.dart';

import '../../../shared/network/constants.dart';
import '../domain/entity/movies_list_response.dart';

abstract class MoviesApiProvider {
  Future<Response<MoviesListResponse>> getPopularMovies();

  Future<Response<MoviesListResponse>> getTopMovies();

  Future<Response<MoviesListResponse>> getUpcomingMovies();
}

class MoviesApiProviderImpl extends GetConnect implements MoviesApiProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => MoviesListResponse.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  @override
  Future<Response<MoviesListResponse>> getPopularMovies() {
    return get(popular, query: {'api_key': apiKey});
  }

  @override
  Future<Response<MoviesListResponse>> getTopMovies() {
    return get(top, query: {'api_key': apiKey});
  }

  @override
  Future<Response<MoviesListResponse>> getUpcomingMovies() {
    return get(upcoming, query: {'api_key': apiKey});
  }
}
