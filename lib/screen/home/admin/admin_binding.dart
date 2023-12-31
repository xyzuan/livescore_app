import 'package:get/get.dart';
import 'package:livescore/screen/home/admin/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}
