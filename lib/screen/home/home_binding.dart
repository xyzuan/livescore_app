import 'package:get/get.dart';
import 'package:livescore/screen/home/dashboard/dashboard_controller.dart';
import 'package:livescore/screen/home/home_controller.dart';
import 'package:livescore/screen/home/profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
