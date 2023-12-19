import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:livescore/models/article_test.dart';

class ApiService extends GetxController {
  static const String _baseUrl = 'https://livescore.xyzuan.my.id/api/article/';
  RxList<Article> articles = RxList<Article>([]);

  RxBool isLoading = false.obs;
  static final _client = http.Client();
  Future<List<Article>> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await _client.get(Uri.parse('${_baseUrl}'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = ArticlesResult.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
        return articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
