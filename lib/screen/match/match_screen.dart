import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/match/components/match_detail.dart';
import 'package:livescore/screen/match/components/match_h2h.dart';
import 'package:livescore/screen/match/components/match_lineup.dart';
import 'package:livescore/screen/match/components/match_score_time.dart';
import 'package:livescore/screen/match/components/match_team_icon.dart';
import 'package:livescore/screen/match/match_controller.dart';
import 'package:livescore/widgets/item_tab.dart';

class MatchPage extends GetView<MatchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181829),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 32,
          left: 20,
          right: 20,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      IconlyLight.arrow_left_2,
                      color: Colors.white,
                    )),
                Text(
                  'UEFA Champion League',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: AppFonts().primaryFont),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                MatchTeamIcon(
                  teamName: controller.teamOne,
                ),
                MatchScoreTime(
                  scoreOne: controller.scoreOne,
                  scoreTwo: controller.scoreTwo,
                ),
                MatchTeamIcon(
                  teamName: controller.teamTwo,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
                height: 50,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final matchTab = controller.matchTab[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleTabSelection(index);
                        },
                        child: ItemTab(
                          tabName: matchTab,
                          isSelected: controller.selectedIndex == index,
                        ),
                      );
                    });
                  },
                )),
          ),
          Container(
            height: 800,
            child: Obx(
                () => ListView(padding: EdgeInsets.only(top: 24), children: [
                      Container(
                        child: IndexedStack(
                          index: controller.selectedIndex.toInt(),
                          children: [
                            MatchDetail(),
                            MatchLineup(),
                            MatchH2H(),
                          ],
                        ),
                      ),
                    ])),
          )
        ],
      ),
    );
  }
}
