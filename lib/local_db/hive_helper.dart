import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie_api/features/favourites/domain/entity/favourite_movie.dart';

class HiveHelper {
  List<FavouriteMovie> favourites = [];

  HiveHelper() {
    try {
      Hive.registerAdapter(FavouriteMovieAdapter());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> addToFavourites(FavouriteMovie movie) async {
    Box box;
    box = await Hive.openBox('db');

    List<dynamic> list = box.get('favourites') ?? [];

    for (int i = 0; i < list.length; i++) {
      if (movie.title == list[i].title) {
        return false;
      }
    }
    favourites = [];
    for (var element in list) {
      favourites.add(element);
    }
    favourites.add(movie);
    box.put('favourites', favourites.toList());

    return true;
  }

  Future<List<FavouriteMovie>> getFavourites() async {
    Box box;
    box = await Hive.openBox('db');
    List<dynamic> list = box.get('favourites') ?? [];
    favourites = [];
    for (var element in list) {
      favourites.add(element);
    }

    return favourites;
  }

  Future<void> deleteFavourite(FavouriteMovie movie) async {
    favourites.remove(movie);
    var box = await Hive.openBox('db');
    box.put('favourites', favourites.toList());
  }
}
