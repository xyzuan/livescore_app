import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class dashboardCard extends StatelessWidget {
  const dashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319,
      height: 161,
      decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.97, -0.25),
            end: Alignment(-0.97, 0.25),
            colors: [Color(0xFF246BFD), Color(0xFF0C0C69)],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: SizedBox(
              width: 158,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/categories_title/football_title.png',
                    alignment: Alignment.bottomLeft,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: Text(
                      'Liverpool UEFA Champion League Celebration',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: AppFonts().primaryFont,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    'Yesterday, 06.30 PM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: AppFonts().primaryFont,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/illustrations/dash_ill.png',
              alignment: Alignment.bottomRight,
            ),
          )
        ],
      ),
    );
  }
}
