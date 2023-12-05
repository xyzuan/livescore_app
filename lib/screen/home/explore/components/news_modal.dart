import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/services/appwrite_handler.dart';

Future<void> newsModal(BuildContext context, String imgId, String headline,
    String body, String externalLink) async {
  final ClientController db = Get.put(ClientController());
  showModalBottomSheet(
    backgroundColor: const Color(0xFF181829),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(42.0)),
    ),
    context: context,
    builder: (context) {
      return Container(
        height: 600,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        ),
        child: Column(children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: FutureBuilder<List<int>>(
                future: db.getImage(imgId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('No image data available');
                  } else {
                    return Image.memory(
                      Uint8List.fromList(snapshot.data!),
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            ),
          ),
        ]),
      );
    },
  );
}
