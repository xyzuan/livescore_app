import 'package:flutter/material.dart';

class itemIconCard extends StatelessWidget {
  final String teamName;
  final double size;

  const itemIconCard({super.key, required this.teamName, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const ShapeDecoration(
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
            width: size / 2,
            height: size / 2,
            child: Stack(
              children: [
                Image.asset(
                    'assets/images/clubs/${teamName.replaceAll(' ', '').toLowerCase()}.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
