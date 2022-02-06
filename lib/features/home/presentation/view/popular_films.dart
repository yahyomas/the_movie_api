import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/favourites/domain/entity/favourite_movie.dart';
import 'package:the_movie_api/features/movie/presentation/view/movie_details_view.dart';

import '../controller/home_controller.dart';
import '../widges/film.dart';

class PopularFilms extends GetView<HomeController> {
  const PopularFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return _controller.popularMovies == null
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
                      final film = _controller.popularMovies!.results[index];
                      return Film(
                        onTap: () {
                          controller.clear();
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
                    itemCount: _controller.popularMovies!.results.length),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
    });
  }
}
