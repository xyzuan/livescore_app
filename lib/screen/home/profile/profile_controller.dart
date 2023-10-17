import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isProficPicPathSet = false.obs;
  RxString profilePicPath = "".obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }

  List<String> profileTab = [
    "My Profile",
    "Activity",
    "Settings",
  ];

  void handleTabSelection(int index) {
    selectedIndex.value = index;
  }
}
