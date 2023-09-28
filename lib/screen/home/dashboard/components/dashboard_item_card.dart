import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
      child: Container(
        height: 68,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFF2A2A3C), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              itemIconCard(
                teamName: teamOne,
              ),
              itemIconCard(
                teamName: teamTwo,
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
              Spacer(),
              Container(
                width: 47,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
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
    );
  }
}
