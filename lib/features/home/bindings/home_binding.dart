import 'package:get/get.dart';
import 'package:the_movie_api/local_db/hive_helper.dart';

import '../data/movies_api_provider.dart';
import '../data/movies_repository.dart';
import '../presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesApiProviderImpl>(() => MoviesApiProviderImpl());
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepository(provider: Get.find<MoviesApiProviderImpl>()));
    Get.lazyPut<HiveHelper>(() => HiveHelper());
    Get.lazyPut<HomeController>(() => HomeController(
        moviesRepository: Get.find<MoviesRepository>(),
        hiveHelper: Get.find<HiveHelper>()));
  }
}
