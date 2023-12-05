import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/admin/admin_controller.dart';
import 'package:livescore/widgets/date_fields.dart';
import 'package:livescore/widgets/text_fields.dart';

Future<void> AdminNewsModal(BuildContext context, String id, String headline,
    String date, String imgId, String body, String externalLink) async {
  final AdminController controller = Get.put(AdminController());

  TextEditingController nameController = TextEditingController(text: headline);
  TextEditingController dateController = TextEditingController(text: date);
  TextEditingController bodyController = TextEditingController(text: body);

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 8),
                    child: Text(
                      'Update Article',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts().primaryFont,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: AppTextField(
                        controller: nameController,
                        text: 'Title',
                        icon: IconlyLight.arrow_right,
                        color: Color(0xFF181829)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: AppTextField(
                        controller: bodyController,
                        text: 'Description',
                        icon: IconlyLight.arrow_right,
                        color: Color(0xFF181829)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: AppDateField(
                        context: context,
                        controller: dateController,
                        text: 'Date',
                        icon: IconlyLight.arrow_right,
                        color: Color(0xFF181829)),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.db.deleteArticle(id);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Color.fromARGB(255, 253, 36, 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontFamily: AppFonts().primaryFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Map<String, dynamic> data = {
                            'name': nameController.text,
                            'description': bodyController.text,
                            'date': dateController.text
                          };
                          controller.db.updateArticle(id, data);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: const Color(0xFF246BFD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontFamily: AppFonts().primaryFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      );
    },
  );
}
