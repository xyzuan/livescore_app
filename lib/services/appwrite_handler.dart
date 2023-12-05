import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();
  Databases? databases;

  RxList<Document> articles = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "656dd0ca67311e2c1790";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);

    databases = Databases(client);
    fetchData();
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      await databases!.deleteDocument(
        collectionId: DBAppWrite().newsCollectionId,
        databaseId: DBAppWrite().dbId,
        documentId: documentId,
      );

      articles.removeWhere((doc) => doc.$id == documentId);
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      var response = await databases!.listDocuments(
          collectionId: DBAppWrite().newsCollectionId,
          databaseId: DBAppWrite().dbId);
      articles.assignAll(response.documents);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future inputArticle(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: DBAppWrite().dbId,
        documentId: ID.unique(),
        collectionId: DBAppWrite().newsCollectionId,
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      fetchData();
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
}
