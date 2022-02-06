import 'package:get/get.dart';
import 'package:the_movie_api/features/movie/data/movie_details_repository.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_details.dart';

class MovieDetailsController extends GetxController {
  MovieDetailsRepository repository;

  MovieDetailsController({required this.repository});

  late String movieId;

  MovieDetails? movieDetails;
  MovieCast? movieCast;

  @override
  void onInit() {
    movieId = Get.arguments['movie_id'];
    super.onInit();
    getData();
  }

  void getData() {
    getDetails();
    getCast();
  }

  Future<void> getDetails() async {
    try {
      movieDetails = await repository.getMovieDetails(movieId);
      update();
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  Future<void> getCast() async {
    try {
      movieCast = await repository.getMovieCast(movieId);
      update();
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  void clear() {
    movieCast = null;
    movieDetails = null;
    update();
  }
}
