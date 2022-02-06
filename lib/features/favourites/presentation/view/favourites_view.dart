import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/favourites/presentation/controller/favourites_controller.dart';
import 'package:the_movie_api/features/home/presentation/widges/film.dart';
import 'package:the_movie_api/shared/drawer/my_drawer.dart';

class FavouritesView extends GetView<FavouritesController> {
  const FavouritesView({Key? key}) : super(key: key);
  static const String route = '/favourites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: const MyDrawer(
          fromHome: false,
        ),
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: Obx(() {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 16,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(controller.myList[index].title),
                      onDismissed: (d) {
                        controller.remove(controller.myList[index]);
                      },
                      child: Film(
                        image: controller.myList[index].image,
                        name: controller.myList[index].title,
                        rate: controller.myList[index].voteAverage,
                        id: '',
                        onLongsPressed: () {},
                        onTap: () {},
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemCount: controller.myList.length),
              const SizedBox(
                height: 16,
              ),
            ],
          );
        }));
  }
}
