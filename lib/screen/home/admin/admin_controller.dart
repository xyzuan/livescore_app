import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livescore/services/appwrite_handler.dart';

class AdminController extends GetxController {
  final ClientController db = Get.put(ClientController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> takeImage(
      ImageSource source, File? pickedFile, String id) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      return;
    } else {
      await db.storeImage(File(pickedImage.path), id);
      Get.snackbar(
        "Image Uploaded Successfully",
        "You success change image",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
