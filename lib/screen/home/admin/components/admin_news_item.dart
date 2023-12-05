import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/admin/components/admin_news_modal.dart';
import 'package:livescore/services/appwrite_handler.dart';

class AdminNewsItem extends StatelessWidget {
  final String id;
  final String headline;
  final String date;
  final String imgId;
  final String body;
  final String externalLink;

  const AdminNewsItem(
      {super.key,
      required this.id,
      required this.headline,
      required this.date,
      required this.imgId,
      required this.body,
      required this.externalLink});

  @override
  Widget build(BuildContext context) {
    final ClientController db = Get.put(ClientController());
    // final inputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    // final outputDateFormat = DateFormat("EEEE, d MMMM yyyy");

    // final inputDate = inputDateFormat.parse(date);
    // final outputDateString = outputDateFormat.format(inputDate);

    return GestureDetector(
      onTap: () => AdminNewsModal(
          context, id, headline, date, imgId, body, externalLink),
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
                    child: FutureBuilder<List<int>>(
                      future: db.getImage(imgId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return Text('No image data available');
                        } else {
                          return Image.memory(
                              Uint8List.fromList(snapshot.data!));
                        }
                      },
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
