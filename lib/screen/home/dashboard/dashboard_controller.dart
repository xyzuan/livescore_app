import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<String> categoryList = [
    "Soccer",
    "Basketball",
    "Baseball",
  ];

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }
}
