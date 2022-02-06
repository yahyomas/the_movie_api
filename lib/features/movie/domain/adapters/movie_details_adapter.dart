import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_details.dart';

abstract class MovieDetailsAdapter {
  Future<MovieDetails> getMovieDetails(String movieId);

  Future<MovieCast> getMovieCast(String movieId);

  Future<MovieDetails> getMovieDerailsForced(String movieId);

  Future<MovieCast> getMovieCastForced(String movieId);
}
