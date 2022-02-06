import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/favourites/domain/entity/favourite_movie.dart';
import 'package:the_movie_api/local_db/hive_helper.dart';

class FavouritesController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'favourites');
  final HiveHelper hiveHelper;

  FavouritesController({required this.hiveHelper});

  @override
  void onInit() {
    getFavourites();
    super.onInit();
  }

  var myList = [].obs;

  Future<void> getFavourites() async {
    myList.value = await hiveHelper.getFavourites();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void remove(FavouriteMovie movie) async {
    myList.remove(movie);
    hiveHelper.deleteFavourite(movie);
  }
}
