import 'package:get/get.dart';
import 'package:livescore/screen/home/standings/standings_controller.dart';

class StandingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StandingsController>(() => StandingsController());
  }
}
