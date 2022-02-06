import 'package:get/get.dart';
import 'package:the_movie_api/features/favourites/presentation/controller/favourites_controller.dart';
import 'package:the_movie_api/local_db/hive_helper.dart';

class FavouritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouritesController(hiveHelper: Get.find<HiveHelper>()));
  }
}
