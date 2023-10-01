import 'package:get/get.dart';

class StandingsController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }
}
