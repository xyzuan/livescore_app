import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/admin/admin_controller.dart';

Future<void> AdminNewsModal(BuildContext context, String id) async {
  final AdminController controller = Get.put(AdminController());

  showModalBottomSheet(
    backgroundColor: const Color(0xFF181829),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(42.0)),
    ),
    context: context,
    builder: (context) {
      return Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.db.deleteDocument(id);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color(0xFF246BFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Delete Article',
                  style: TextStyle(
                    fontFamily: AppFonts().primaryFont,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]),
      );
    },
  );
}
