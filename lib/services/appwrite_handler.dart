import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();
  Databases? databases;
  Storage? storages;

  RxList<Document> articles = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    const endPoint = baseApi;
    const projectID = projectId;
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);

    databases = Databases(client);
    storages = Storage(client);
    fetchArticle();
  }

  Future<void> deleteArticle(String documentId) async {
    try {
      await databases!.deleteDocument(
        collectionId: articlesCollectionId,
        databaseId: dbId,
        documentId: documentId,
      );

      articles.removeWhere((doc) => doc.$id == documentId);
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<void> fetchArticle() async {
    try {
      var response = await databases!
          .listDocuments(collectionId: articlesCollectionId, databaseId: dbId);
      articles.assignAll(response.documents);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future inputArticle(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: dbId,
        documentId: ID.unique(),
        collectionId: articlesCollectionId,
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      fetchArticle();
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

  Future<void> updateArticle(
      String documentId, Map<String, dynamic> updatedData) async {
    try {
      await databases!.updateDocument(
        collectionId: articlesCollectionId,
        databaseId: dbId,
        documentId: documentId,
        data: updatedData,
      );
      fetchArticle();
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Future storeImage(io.File file, id) async {
    try {
      final result = await storages!.createFile(
        bucketId: '656f770ec6499a3c11c4',
        fileId: id,
        file: InputFile.fromPath(
          path: file.path,
          filename: 'image.jpg',
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
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

  Future<List<int>> getImage(String fileId) async {
    try {
      final result = await storages!
          .getFileDownload(bucketId: '656f770ec6499a3c11c4', fileId: fileId);
      return result;
    } catch (e) {
      print('Error fetching image: $e');
      return [];
    }
  }
}
