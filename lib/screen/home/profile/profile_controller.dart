import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<String> profileTab = [
    "My Profile",
    "Activity",
    "Settings",
  ];

  void handleTabSelection(int index) {
    selectedIndex.value = index;
  }
}
