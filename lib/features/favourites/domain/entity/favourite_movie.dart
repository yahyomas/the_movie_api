import 'package:hive_flutter/hive_flutter.dart';

part 'favourite_movie.g.dart';

@HiveType(typeId: 1)
class FavouriteMovie {
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String voteAverage;

  FavouriteMovie(
      {required this.image, required this.title, required this.voteAverage});
}
