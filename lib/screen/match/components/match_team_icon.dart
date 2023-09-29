import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/widgets/item_icon_card.dart';

class MatchTeamIcon extends StatelessWidget {
  final String teamName;

  const MatchTeamIcon({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: itemIconCard(
            teamName: this.teamName,
            size: 80,
          ),
        ),
        Text(
          this.teamName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts().primaryFont,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
