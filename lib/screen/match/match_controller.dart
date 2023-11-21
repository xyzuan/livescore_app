import 'package:get/get.dart';

class MatchController extends GetxController {
  final String teamOne;
  final String teamTwo;
  final int scoreOne;
  final int scoreTwo;

  RxInt selectedIndex = 0.obs;
  var listIndex = 0;

  List<String> matchTab = [
    "Match Detail",
    "Line Up",
    "H2H",
  ];

  void handleTabSelection(int index) {
    selectedIndex.value = index;
    listIndex = index;
  }

  MatchController({
    required this.teamOne,
    required this.teamTwo,
    required this.scoreOne,
    required this.scoreTwo,
  });
}
