import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/services/appwrite_handler.dart';

class StandingsController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
