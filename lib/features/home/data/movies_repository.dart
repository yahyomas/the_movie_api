import '../domain/adapters/movies_repository_adapter.dart';
import '../domain/entity/movies_list_response.dart';
import 'movies_api_provider.dart';

class MoviesRepository implements MoviesRepositoryAdapter {
  final MoviesApiProvider provider;

  MoviesRepository({required this.provider});

  MoviesListResponse? _popularFilms;
  MoviesListResponse? _topFilms;
  MoviesListResponse? _upcomingFilms;

  @override
  Future<MoviesListResponse> getPopularMovies() async {
    if (_popularFilms != null) {
      return _popularFilms!;
    }
    final response = await provider.getPopularMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _popularFilms = response.body!;
      return _popularFilms!;
    }
  }

  @override
  Future<MoviesListResponse> getTopMovies() async {
    if (_topFilms != null) {
      return _topFilms!;
    }
    final response = await provider.getTopMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _topFilms = response.body!;
      return _topFilms!;
    }
  }

  @override
  Future<MoviesListResponse> getUpcomingMovies() async {
    if (_upcomingFilms != null) {
      return _upcomingFilms!;
    }
    final response = await provider.getUpcomingMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _upcomingFilms = response.body!;
      return _upcomingFilms!;
    }
  }

  @override
  Future<MoviesListResponse> getPopularMoviesForced() async {
    final response = await provider.getPopularMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _popularFilms = response.body!;
      return response.body!;
    }
  }

  @override
  Future<MoviesListResponse> getTopMoviesForced() async {
    final response = await provider.getTopMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _topFilms = response.body!;
      return response.body!;
    }
  }

  @override
  Future<MoviesListResponse> getUpcomingMoviesForced() async {
    final response = await provider.getUpcomingMovies();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _upcomingFilms = response.body!;
      return response.body!;
    }
  }
}
