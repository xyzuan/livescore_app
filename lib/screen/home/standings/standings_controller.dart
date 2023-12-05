import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/services/appwrite_handler.dart';

class StandingsController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final ClientController dbController = Get.put(ClientController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  RxList<Document> documents = <Document>[].obs;

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }

  Databases? databases;
  @override
  void onInit() {
    super.onInit();
    databases = Databases(dbController.client);
  }

  Future inputSoccer(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "656ddee609d4eb81f0c7",
        documentId: ID.unique(),
        collectionId: "656ddef5f14921f91a3d",
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      print("DatabaseController:: inputName $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> fetchData() async {
    try {
      // Replace 'collectionId' with the ID of your collection
      var response = await databases!.listDocuments(
          collectionId: "656ddef5f14921f91a3d",
          databaseId: "656ddee609d4eb81f0c7");
      documents.assignAll(response.documents);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
