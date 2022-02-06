import 'package:the_movie_api/features/actor/domain/entity/actor_films.dart';

abstract class ActorFilmsAdapter {
  Future<ActorFilms> getActorFilms(String actorId);

  Future<ActorFilms> getActorFilmsForced(String actorId);
}
