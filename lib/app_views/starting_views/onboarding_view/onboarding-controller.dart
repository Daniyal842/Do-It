import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    pageIndex.value = index; // page change hone par update
  }

  void nextPage() {
    if (pageIndex.value < 3) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Get.off(() => LoginView());
      Get.offNamed('/SignInView');
    }
  }
}
