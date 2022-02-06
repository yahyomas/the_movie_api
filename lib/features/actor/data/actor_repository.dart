import 'package:the_movie_api/features/actor/data/actor_api_provider.dart';
import 'package:the_movie_api/features/actor/domain/adapters/actor_films_adapter.dart';
import 'package:the_movie_api/features/actor/domain/entity/actor_films.dart';

class ActorRepository extends ActorFilmsAdapter {
  ActorApiProvider provider;

  ActorRepository({required this.provider});

  ActorFilms? _actorFilms;

  @override
  Future<ActorFilms> getActorFilms(String actorId) async {
    if (_actorFilms != null) {
      return _actorFilms!;
    }
    final response = await provider.getActorFilms(actorId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _actorFilms = response.body!;
      return response.body!;
    }
  }

  @override
  Future<ActorFilms> getActorFilmsForced(String actorId) async {
    final response = await provider.getActorFilms(actorId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      _actorFilms = response.body!;
      return response.body!;
    }
  }
}
