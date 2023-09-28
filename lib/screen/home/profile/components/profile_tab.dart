import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class ProfileTab extends StatefulWidget {
  final String tabName;
  final bool isSelected;

  const ProfileTab({
    super.key,
    required this.tabName,
    this.isSelected = false,
  });

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.68, -0.74),
              end: Alignment(-0.68, 0.74),
              colors: widget.isSelected
                  ? [Color(0xFFF4A58A), Color(0xFFED6B4E)]
                  : [Colors.transparent, Colors.transparent],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                widget.tabName,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts().primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )),
        )
      ],
    );
  }
}
