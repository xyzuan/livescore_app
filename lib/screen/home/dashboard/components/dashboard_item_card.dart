import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/match/match_binding.dart';
import 'package:livescore/screen/match/match_screen.dart';
import 'package:livescore/widgets/item_icon_card.dart';

class dashboardItemCard extends StatelessWidget {
  final String status;
  final String teamOne, teamTwo;
  final int scoreOne, scoreTwo;

  const dashboardItemCard({
    super.key,
    required this.status,
    required this.teamOne,
    required this.teamTwo,
    required this.scoreOne,
    required this.scoreTwo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => MatchPage(),
          binding: MatchBinding(
            teamOne: teamOne,
            teamTwo: teamTwo,
            scoreOne: scoreOne,
            scoreTwo: scoreTwo,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
              color: const Color(0xFF2A2A3C),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                itemIconCard(
                  teamName: teamOne,
                  size: 36,
                ),
                itemIconCard(
                  teamName: teamTwo,
                  size: 36,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        teamOne,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts().primaryFont,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        scoreOne.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts().primaryFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'vs',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts().primaryFont,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts().primaryFont,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        teamTwo,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts().primaryFont,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        scoreTwo.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts().primaryFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 42,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF222232),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: AppFonts().primaryFont,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
