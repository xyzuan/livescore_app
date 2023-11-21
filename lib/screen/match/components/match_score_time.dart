import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class MatchScoreTime extends StatelessWidget {
  final int scoreOne;
  final int scoreTwo;

  const MatchScoreTime({
    super.key,
    required this.scoreOne,
    required this.scoreTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${scoreOne} - ${scoreTwo}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts().primaryFont),
            ),
          ),
          Text(
            '90.15',
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts().primaryFont,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
