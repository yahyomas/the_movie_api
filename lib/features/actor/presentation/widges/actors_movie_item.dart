import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActorsMovieItem extends StatelessWidget {
  const ActorsMovieItem(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  final String title;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image.isEmpty
                ? const SizedBox(
                    height: 120,
                  )
                : SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                      child: CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/original' + image,
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
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
