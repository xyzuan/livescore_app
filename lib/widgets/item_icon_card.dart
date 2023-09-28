import 'package:flutter/material.dart';

class itemIconCard extends StatelessWidget {
  final String teamName;

  const itemIconCard({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              color: Color(0xFF222232),
              shape: OvalBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF2A2A3C),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 22,
            height: 22,
            child: Stack(
              children: [
                Image.asset(
                    'assets/images/${teamName.replaceAll(' ', '').toLowerCase()}.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
