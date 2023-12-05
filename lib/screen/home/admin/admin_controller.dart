import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/services/appwrite_handler.dart';

class AdminController extends GetxController {
  final ClientController db = Get.put(ClientController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
}
