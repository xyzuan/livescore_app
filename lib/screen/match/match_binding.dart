import 'package:get/get.dart';
import 'package:livescore/screen/match/match_controller.dart';

class MatchBinding extends Bindings {
  final String teamOne, teamTwo;
  final int scoreOne, scoreTwo;

  MatchBinding({
    required this.teamOne,
    required this.teamTwo,
    required this.scoreOne,
    required this.scoreTwo,
  });

  @override
  void dependencies() {
    Get.lazyPut<MatchController>(() => MatchController(
          teamOne: teamOne,
          teamTwo: teamTwo,
          scoreOne: scoreOne,
          scoreTwo: scoreTwo,
        ));
  }
}
