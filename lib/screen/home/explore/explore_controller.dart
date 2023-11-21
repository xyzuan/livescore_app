import 'dart:convert';

import 'package:get/get.dart';
import 'package:livescore/constant/api.dart';
import 'package:livescore/models/article.dart';
import 'package:http/http.dart' as http;

class ExploreController extends GetxController {
  var isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  ArticleModel? articleModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http
          .get(Uri.tryParse('${APIS.mainApi}/api/article')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        articleModel = ArticleModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  void handleCategorySelection(int index) {
    selectedIndex.value = index;
  }
}
