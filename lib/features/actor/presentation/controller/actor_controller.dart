import 'package:get/get.dart';
import 'package:the_movie_api/features/actor/data/actor_repository.dart';
import 'package:the_movie_api/features/actor/domain/entity/actor_films.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart'
    as m_cast;

class ActorController extends GetxController {
  final ActorRepository repository;
  ActorFilms? actorFilms;

  ActorController({required this.repository});

  late m_cast.Cast actor;

  @override
  void onInit() {
    actor = Get.arguments['actor'];
    super.onInit();
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      actorFilms = await repository.getActorFilms(actor.id.toString());
      update();
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  void clear() {
    actorFilms = null;
    update();
  }
}
