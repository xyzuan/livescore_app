import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isProficPicPathSet = false.obs;
  RxString profilePicPath = "".obs;

  ImagePicker imagePicker = ImagePicker();

  List<String> profileTab = [
    "My Profile",
    "Activity",
    "Settings",
  ];

  void handleTabSelection(int index) {
    selectedIndex.value = index;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    String? storedImagePath = await getStoredImagePath();
    if (storedImagePath != null && storedImagePath.isNotEmpty) {
      setProfileImagePath(storedImagePath);
    }
  }

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }

  Future<String?> getStoredImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileImagePath');
  }

  Future<String?> setStoredImagePath({localImage}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', localImage.path);
    return null;
  }

  Future<void> takePhoto(ImageSource source, File? pickedFile) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      return;
    } else {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = "profile_image.png";

      setProfileImagePath(File(pickedImage.path).path);
      setStoredImagePath(
          localImage:
              await File(pickedImage.path).copy('${appDir.path}/$fileName'));

      Get.back();
      Get.snackbar(
        "Image Pick Successfully",
        "You success change image",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
