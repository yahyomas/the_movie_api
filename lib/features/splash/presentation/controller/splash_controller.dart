import 'package:get/get.dart';
import 'package:the_movie_api/features/home/presentation/view/home_view.dart';

class SplashController extends GetxController {
  double width = 15;
  double height = 10;

  @override
  void onInit() {
    super.onInit();
    animate();
  }

  Future<void> animate() async {
    Future.delayed(const Duration(microseconds: 100)).then((value) {
      width = Get.width - 128;
      height = 88;
      update();
    });
  }

  void navigate() {
    Get.offAndToNamed(HomeView.route);
  }
}
