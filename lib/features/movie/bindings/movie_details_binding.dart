import 'package:get/get.dart';
import 'package:the_movie_api/features/movie/data/movie_details_provider.dart';
import 'package:the_movie_api/features/movie/data/movie_details_repository.dart';
import 'package:the_movie_api/features/movie/presentation/controller/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsApiProviderImp>(() => MovieDetailsApiProviderImp(),
        fenix: true);
    Get.lazyPut(
        () => MovieDetailsRepository(
            provider: Get.find<MovieDetailsApiProviderImp>()),
        fenix: true);
    Get.lazyPut<MovieDetailsController>(
        () => MovieDetailsController(
            repository: Get.find<MovieDetailsRepository>()),
        fenix: true);
  }
}
