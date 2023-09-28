import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';

class itemHeaders extends StatelessWidget {
  final String leagueName;
  final String region;

  const itemHeaders({
    super.key,
    required this.leagueName,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 18, 8.0, 0),
      child: Container(
        child: Row(
          children: [
            Row(
              children: [
                Image.asset('assets/images/${region.toLowerCase()}.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leagueName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts().primaryFont),
                      ),
                      Text(
                        region,
                        style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts().primaryFont),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                IconlyLight.arrow_right_2,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
