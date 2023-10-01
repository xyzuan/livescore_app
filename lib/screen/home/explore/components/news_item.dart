import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/colors.dart';
import 'package:livescore/constant/fonts.dart';

class NewsItem extends StatelessWidget {
  final String headline;
  final String date;
  final String img;

  const NewsItem(
      {super.key,
      required this.headline,
      required this.date,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: Row(
        children: [
          Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text(img)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts().primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(date,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts().primaryFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),
          Spacer(),
          Icon(
            IconlyLight.bookmark,
            color: hexToColor('#65656B'),
          )
        ],
      ),
    );
  }
}
