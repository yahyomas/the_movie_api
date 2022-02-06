import 'package:get/get.dart';
import 'package:the_movie_api/features/home/bindings/home_binding.dart';
import 'package:the_movie_api/features/home/presentation/view/home_view.dart';

import '../features/actor/bindings/actor_binding.dart';
import '../features/actor/presentation/view/actor_view.dart';
import '../features/favourites/bindings/favourite_binding.dart';
import '../features/favourites/presentation/view/favourites_view.dart';
import '../features/movie/bindings/movie_details_binding.dart';
import '../features/movie/presentation/view/movie_details_view.dart';
import '../features/splash/bindings/splash_binding.dart';
import '../features/splash/presentation/view/splash_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: SplashView.route,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: HomeView.route,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: FavouritesView.route,
      page: () => const FavouritesView(),
      binding: FavouritesBinding(),
    ),
    GetPage(
      name: MovieDetailsView.route,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: ActorView.route,
      page: () => const ActorView(),
      binding: ActorBinding(),
    ),
  ];
}
