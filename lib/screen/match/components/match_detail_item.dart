import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class MatchDetailItem extends StatelessWidget {
  final int teamOne, teamTwo;
  final String type;
  const MatchDetailItem(
      {super.key,
      required this.teamOne,
      required this.teamTwo,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailScoreItem(
            value: teamOne,
          ),
          Expanded(
            child: DetailTypeItem(
              type: this.type,
            ),
          ),
          DetailScoreItem(
            value: teamTwo,
          )
        ],
      ),
    );
  }
}

class DetailTypeItem extends StatelessWidget {
  final String type;

  const DetailTypeItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70),
      child: Column(
        children: [
          Text(type,
              style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontSize: 20,
                fontFamily: AppFonts().primaryFont,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class DetailScoreItem extends StatelessWidget {
  final int value;

  const DetailScoreItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: AppFonts().primaryFont,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
