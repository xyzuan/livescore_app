import 'package:get/get.dart';

class HomeController extends GetxController {
  static var data = Get.arguments;

  var tabIndex = 0;

  static void updateData() {
    data = Get.arguments;
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
