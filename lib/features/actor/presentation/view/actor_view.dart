import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/actor/presentation/controller/actor_controller.dart';
import 'package:the_movie_api/features/actor/presentation/widges/actors_movie_item.dart';
import 'package:the_movie_api/features/movie/presentation/controller/movie_details_controller.dart';

import '../../../movie/presentation/view/movie_details_view.dart';

class ActorView extends StatelessWidget {
  const ActorView({Key? key}) : super(key: key);
  static const String route = '/actor_view';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MovieDetailsController>().getData();
        return true;
      },
      child: GetBuilder<ActorController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(controller.actor.name),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: Get.width - 48,
                  height: Get.width - 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${controller.actor.profilePath}',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  controller.actor.knownForDepartment,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Movies',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              controller.actorFilms == null
                  ? const SizedBox()
                  : SizedBox(
                      height: 200,
                      child: ListView(
                        cacheExtent: 5,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final film = controller.actorFilms!.cast[index];
                                return ActorsMovieItem(
                                  title: film.title ?? '',
                                  image: film.backdropPath,
                                  onTap: () {
                                    controller.clear();
                                    Get.toNamed(MovieDetailsView.route,
                                        arguments: {
                                          'movie_id': film.id.toString(),
                                          'from_home': false
                                        });
                                    Get.find<MovieDetailsController>()
                                        .getData();
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 12,
                                );
                              },
                              itemCount: controller.actorFilms!.cast.length),
                          const SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        );
      }),
    );
  }
}
