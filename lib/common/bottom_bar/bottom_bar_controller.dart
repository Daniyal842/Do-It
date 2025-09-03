import 'package:get/get.dart';

class BottomBarController extends GetxController {
  // current selected index
  var selectedIndex = 0.obs;

  // change tab
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
