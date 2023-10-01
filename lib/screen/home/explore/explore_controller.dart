import 'package:get/get.dart';

class ExploreController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }
}
