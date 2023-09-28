import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const CircleAvatar(
        radius: 80,
        backgroundColor: Color(0xFF222232),
        backgroundImage: AssetImage('assets/images/jody.png'),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 42,
            height: 42,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.68, -0.74),
                end: Alignment(-0.68, 0.74),
                colors: [Color(0xFFF4A58A), Color(0xFFED6B4E)],
              ),
              shape: OvalBorder(
                side: BorderSide(width: 2, color: Color(0xFF181829)),
              ),
            ),
          ),
          const Icon(
            IconlyLight.edit,
            color: Colors.white,
          )
        ]),
      )
    ]);
  }
}
