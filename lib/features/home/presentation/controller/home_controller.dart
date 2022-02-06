import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/favourites/domain/entity/favourite_movie.dart';
import 'package:the_movie_api/local_db/hive_helper.dart';

import '../../data/movies_repository.dart';
import '../../domain/entity/movies_list_response.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final MoviesRepository moviesRepository;
  final HiveHelper hiveHelper;

  HomeController({required this.moviesRepository, required this.hiveHelper});

  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'POPULAR'),
    Tab(text: 'TOP'),
    Tab(text: 'UPCOMING'),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'home');
  late TabController controller;

  MoviesListResponse? popularMovies;
  MoviesListResponse? topMovies;
  MoviesListResponse? upcomingMovies;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
    getData();
  }

  void getData() {
    getPopularMovies();
    getTopMovies();
    getUpcomingMovies();
  }

  Future<void> getPopularMovies() async {
    try {
      popularMovies = await moviesRepository.getPopularMovies();
      update();
    } catch (e) {
      Get.snackbar("Error!", e.toString());
    }
  }

  Future<void> getTopMovies() async {
    try {
      topMovies = await moviesRepository.getTopMovies();
      update();
    } catch (e) {
      Get.snackbar("Error!", e.toString());
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      upcomingMovies = await moviesRepository.getUpcomingMovies();
      update();
    } catch (e) {
      Get.snackbar("Error!", e.toString());
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void clear() {
    popularMovies = null;
    topMovies = null;
    upcomingMovies = null;
    update();
  }

  void showDialog(FavouriteMovie movie) async {
    Get.defaultDialog(
        title: 'Do you want to add this movie to favourites?',
        textCancel: 'No',
        textConfirm: 'Yes',
        barrierDismissible: false,
        content: const SizedBox(),
        onConfirm: () {
          Get.back();
          saveFavourite(movie);
        });
  }

  Future<void> saveFavourite(FavouriteMovie movie) async {
    bool res = await hiveHelper.addToFavourites(movie);
    if (res) {
      Get.snackbar('Done', 'Successfully added!');
    } else {
      Get.snackbar('Error', 'Movie already added!');
    }
  }
}
