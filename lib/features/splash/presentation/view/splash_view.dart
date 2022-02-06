import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_api/features/splash/presentation/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  static const String route = '/presentation_view';

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (value) {
      return Scaffold(
        body: Center(
          child: AnimatedContainer(
            onEnd: controller.navigate,
            width: value.width,
            height: value.height,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 2),
            child: const FittedBox(
              child: Text(
                'The Movie!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    });
  }
}
