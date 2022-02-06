import 'package:the_movie_api/features/movie/data/movie_details_provider.dart';
import 'package:the_movie_api/features/movie/domain/adapters/movie_details_adapter.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_details.dart';

class MovieDetailsRepository extends MovieDetailsAdapter {
  final MovieDetailsApiProvider provider;

  MovieDetailsRepository({required this.provider});

  MovieDetails? _movieDetails;
  MovieCast? _movieCast;

  @override
  Future<MovieCast> getMovieCast(String movieId) async {
    if (_movieCast != null) {
      return _movieCast!;
    }
    final response = await provider.getMovieCast(movieId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _movieCast = response.body!;
      return response.body!;
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    if (_movieDetails != null) {
      return _movieDetails!;
    }
    final response = await provider.getMovieDetails(movieId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _movieDetails = response.body;
      return response.body!;
    }
  }

  @override
  Future<MovieCast> getMovieCastForced(String movieId) async {
    final response = await provider.getMovieCast(movieId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _movieCast = response.body!;
      return response.body!;
    }
  }

  @override
  Future<MovieDetails> getMovieDerailsForced(String movieId) async {
    final response = await provider.getMovieDetails(movieId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _movieDetails = response.body;
      return response.body!;
    }
  }
}
