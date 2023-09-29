import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/dashboard/components/dashboard_item_card.dart';
import 'package:livescore/screen/match/components/match_detail_item.dart';

class MatchDetail extends StatelessWidget {
  const MatchDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MatchDetailStats(),
        Row(
          children: [
            Text(
              'Other Match',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts().primaryFont),
            ),
            Spacer(),
            Text(
              'See all',
              style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontSize: 12,
                fontFamily: AppFonts().primaryFont,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        dashboardItemCard(
            status: 'ht',
            teamOne: 'Aston Villa',
            scoreOne: 2,
            teamTwo: 'Liverpool',
            scoreTwo: 3),
        dashboardItemCard(
          status: 'ft',
          teamOne: 'Chelsea',
          scoreOne: 2,
          teamTwo: 'Southampton',
          scoreTwo: 0,
        ),
        dashboardItemCard(
          status: 'ft',
          teamOne: 'Real Madrid',
          scoreOne: 1,
          teamTwo: 'Barcelona',
          scoreTwo: 3,
        ),
        dashboardItemCard(
          status: 'ht',
          teamOne: 'Barcelona',
          scoreOne: 2,
          teamTwo: 'Real Madrid',
          scoreTwo: 0,
        ),
        dashboardItemCard(
          status: 'ht',
          teamOne: 'Barcelona',
          scoreOne: 2,
          teamTwo: 'Real Madrid',
          scoreTwo: 0,
        ),
      ],
    );
  }
}

class MatchDetailStats extends StatelessWidget {
  const MatchDetailStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        children: [
          MatchDetailItem(
            teamOne: 8,
            teamTwo: 12,
            type: 'Shotting',
          ),
          MatchDetailItem(
            teamOne: 22,
            teamTwo: 29,
            type: 'Attacks',
          ),
          MatchDetailItem(
            teamOne: 42,
            teamTwo: 58,
            type: 'Possesion',
          ),
          MatchDetailItem(
            teamOne: 3,
            teamTwo: 5,
            type: 'Cards',
          ),
          MatchDetailItem(
            teamOne: 8,
            teamTwo: 7,
            type: 'Corners',
          ),
        ],
      ),
    );
  }
}
