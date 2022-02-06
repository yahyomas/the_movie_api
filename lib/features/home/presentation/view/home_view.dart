import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/home/presentation/view/popular_films.dart';

import '../../../../shared/drawer/my_drawer.dart';
import '../controller/home_controller.dart';
import 'top_films.dart';
import 'upcomming_films.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  static const String route = '/home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const MyDrawer(
        fromHome: true,
      ),
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: controller.openDrawer,
        ),
        bottom: TabBar(
          controller: controller.controller,
          tabs: controller.myTabs,
        ),
      ),
      body: TabBarView(
        controller: controller.controller,
        children: const [
          PopularFilms(),
          TopFilms(),
          UpcomingFilms(),
        ],
      ),
    );
  }
}
