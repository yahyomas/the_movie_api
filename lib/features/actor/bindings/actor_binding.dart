import 'package:get/get.dart';
import 'package:the_movie_api/features/actor/data/actor_api_provider.dart';
import 'package:the_movie_api/features/actor/data/actor_repository.dart';
import 'package:the_movie_api/features/actor/presentation/controller/actor_controller.dart';

class ActorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActorApiProviderImp>(() => ActorApiProviderImp(), fenix: true);
    Get.lazyPut(
        () => ActorRepository(provider: Get.find<ActorApiProviderImp>()),
        fenix: true);
    Get.lazyPut<ActorController>(
        () => ActorController(repository: Get.find<ActorRepository>()),
        fenix: true);
  }
}
