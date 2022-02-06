import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/home/presentation/controller/home_controller.dart';
import 'package:the_movie_api/features/home/presentation/widges/film.dart';

import '../../../favourites/domain/entity/favourite_movie.dart';
import '../../../movie/presentation/view/movie_details_view.dart';

class UpcomingFilms extends GetView<HomeController> {
  const UpcomingFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return _controller.upcomingMovies == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 16,
                ),
                ListView.separated(
                    cacheExtent: 50,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final film = _controller.upcomingMovies!.results[index];
                      return Film(
                        onTap: () {
                          Get.toNamed(MovieDetailsView.route, arguments: {
                            'movie_id': film.id.toString(),
                            'from_home': true
                          });
                        },
                        onLongsPressed: () {
                          controller.showDialog(FavouriteMovie(
                              image: film.backdropPath,
                              title: film.title,
                              voteAverage: film.voteAverage.toString()));
                        },
                        image: film.backdropPath,
                        name: film.title,
                        rate: film.voteAverage.toString(),
                        id: film.id.toString(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: _controller.upcomingMovies!.results.length),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
    });
  }
}
