import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/colors.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/explore/components/news_modal.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  final String headline;
  final String date;
  final String img;
  final String body;
  final String externalLink;

  const NewsItem(
      {super.key,
      required this.headline,
      required this.date,
      required this.img,
      required this.body,
      required this.externalLink});

  @override
  Widget build(BuildContext context) {
    final inputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final outputDateFormat = DateFormat("EEEE, d MMMM yyyy");

    final inputDate = inputDateFormat.parse(date);
    final outputDateString = outputDateFormat.format(inputDate);

    return GestureDetector(
      onTap: () => newsModal(context, img, headline, body, externalLink),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: Row(
            children: [
              SizedBox(
                  height: 64,
                  width: 64,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.network(img, fit: BoxFit.cover),
                  )),
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
                      Text(outputDateString,
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
        ),
      ),
    );
  }
}
