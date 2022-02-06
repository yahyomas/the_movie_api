import '../entity/movies_list_response.dart';

abstract class MoviesRepositoryAdapter {
  Future<MoviesListResponse> getPopularMovies();

  Future<MoviesListResponse> getTopMovies();

  Future<MoviesListResponse> getUpcomingMovies();

  Future<MoviesListResponse> getPopularMoviesForced();

  Future<MoviesListResponse> getTopMoviesForced();

  Future<MoviesListResponse> getUpcomingMoviesForced();
}
