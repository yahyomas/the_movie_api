import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/actor/presentation/controller/actor_controller.dart';
import 'package:the_movie_api/features/actor/presentation/view/actor_view.dart';
import 'package:the_movie_api/features/home/presentation/controller/home_controller.dart';
import 'package:the_movie_api/features/movie/presentation/controller/movie_details_controller.dart';
import 'package:the_movie_api/features/movie/presentation/widges/actor_item.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);
  static const String route = '/movie_details';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Get.arguments['from_home']) {
          Get.find<HomeController>().getData();
        } else {
          Get.find<ActorController>().getMovies();
        }
        return true;
      },
      child: GetBuilder<MovieDetailsController>(builder: (_controller) {
        return _controller.movieDetails == null
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(_controller.movieDetails!.title),
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
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original' +
                                _controller.movieDetails!.posterPath,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        _controller.movieDetails!.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Actors',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _controller.movieCast == null
                        ? const SizedBox()
                        : SizedBox(
                            height: 180,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                ListView.separated(
                                    cacheExtent: 5,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final actor =
                                          _controller.movieCast!.cast[index];
                                      return ActorItem(
                                          actor: actor,
                                          onTap: () {
                                            _controller.clear();
                                            Get.toNamed(ActorView.route,
                                                arguments: {'actor': actor});
                                          });
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 12,
                                      );
                                    },
                                    itemCount:
                                        _controller.movieCast!.cast.length),
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
