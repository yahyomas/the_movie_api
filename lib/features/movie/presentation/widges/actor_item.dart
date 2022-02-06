import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_api/features/movie/domain/entity/movie_cast.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({Key? key, required this.actor, required this.onTap})
      : super(key: key);
  final Function() onTap;

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 180,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            actor.profilePath == null
                ? const SizedBox(
                    height: 120,
                    width: 120,
                  )
                : SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original${actor.profilePath}',
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
            const SizedBox(
              height: 12,
            ),
            Text(
              actor.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
