import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/admin/admin_controller.dart';
import 'package:livescore/screen/home/admin/components/admin_news_item.dart';
import 'package:livescore/utils/uuid.dart';

import 'package:livescore/widgets/date_fields.dart';
import 'package:livescore/widgets/text_fields.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({Key? key, this.pickedFile}) : super(key: key);

  final File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181829),
      floatingActionButton: FloatingActionButton(
          child: Icon(IconlyBold.plus),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFF222232),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(42.0)),
              ),
              builder: (context) {
                final id = generateUUID();

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 18, 0, 8),
                            child: Text(
                              'Post Article',
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
                                controller: controller.nameController,
                                text: 'Title',
                                icon: IconlyLight.arrow_right,
                                color: Color(0xFF181829)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                            child: AppTextField(
                                controller: controller.descriptionController,
                                text: 'Description',
                                icon: IconlyLight.arrow_right,
                                color: Color(0xFF181829)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                            child: AppDateField(
                                context: context,
                                controller: controller.dateController,
                                text: 'Date',
                                icon: IconlyLight.arrow_right,
                                color: Color(0xFF181829)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: const Color(0xFF222232),
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24, 18, 24, 24),
                                            child: Row(children: [
                                              IconButton(
                                                  color: Colors.white,
                                                  onPressed: () async {
                                                    await controller.takeImage(
                                                        ImageSource.gallery,
                                                        pickedFile,
                                                        id);
                                                  },
                                                  icon: Icon(IconlyBold.image)),
                                              IconButton(
                                                  color: Colors.white,
                                                  onPressed: () async {
                                                    await controller.takeImage(
                                                        ImageSource.camera,
                                                        pickedFile,
                                                        id);
                                                  },
                                                  icon: Icon(IconlyBold.camera))
                                            ]),
                                          ),
                                        );
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(20),
                                  backgroundColor: const Color(0xFF246BFD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Upload Image',
                                  style: TextStyle(
                                    fontFamily: AppFonts().primaryFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller
                                          .nameController.text.isNotEmpty &&
                                      controller.descriptionController.text
                                          .isNotEmpty &&
                                      controller
                                          .dateController.text.isNotEmpty) {
                                    Map<String, dynamic> data = {
                                      'name': controller.nameController.text,
                                      'description':
                                          controller.descriptionController.text,
                                      'date': controller.dateController.text,
                                      'imgId': id
                                    };
                                    controller.db.inputArticle(data);
                                  } else {
                                    Get.snackbar(
                                      'Input Error',
                                      'Some form are missing',
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(20),
                                  backgroundColor: const Color(0xFF246BFD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Upload Article',
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
                  ),
                );
              },
            );
          }),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 32,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Admin Panel',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts().primaryFont,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Container(
                height: null,
                child: Obx(
                  () => controller.db.articles.isNotEmpty == true
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.db.articles.length,
                          itemBuilder: (context, index) {
                            final article = controller.db.articles[index];
                            return AdminNewsItem(
                              id: article.$id.toString(),
                              headline: article.data["name"].toString(),
                              date: article.data["date"].toString(),
                              imgId: article.data["imgId"].toString(),
                              body: article.data["description"].toString(),
                              externalLink: article.data["img"].toString(),
                            );
                          },
                        )
                      : Center(
                          child: Text('No articles available'),
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
