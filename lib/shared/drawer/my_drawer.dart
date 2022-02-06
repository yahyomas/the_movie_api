import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/favourites/presentation/view/favourites_view.dart';
import '../../features/home/presentation/view/home_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.fromHome}) : super(key: key);
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: Get.height,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height / 10,
          ),
          InkWell(
            onTap: () {
              Get.back();
              if (fromHome) {
                Get.offAndToNamed(FavouritesView.route);
              } else {
                Get.offAndToNamed(HomeView.route);
              }
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            fromHome ? Icons.star_outline : Icons.home_outlined,
                            color: Colors.white,
                            size: 72,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            fromHome ? "Favourites" : "Home",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
