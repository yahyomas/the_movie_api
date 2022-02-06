import 'package:get/get.dart';
import 'package:the_movie_api/features/actor/domain/entity/actor_films.dart';
import 'package:the_movie_api/shared/network/constants.dart';

abstract class ActorApiProvider {
  Future<Response<ActorFilms>> getActorFilms(String actorId);
}

class ActorApiProviderImp extends GetConnect implements ActorApiProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => ActorFilms.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = 'https://api.themoviedb.org/3/person/';
    super.onInit();
  }

  @override
  Future<Response<ActorFilms>> getActorFilms(String actorId) {
    print('https://api.themoviedb.org/3/person/$actorId/movie_credits');
    return get('$actorId/movie_credits', query: {'api_key': apiKey});
  }
}
