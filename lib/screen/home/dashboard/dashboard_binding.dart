import 'package:get/get.dart';
import 'package:livescore/screen/home/dashboard/dashboard_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
