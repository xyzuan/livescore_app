import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/admin/admin_controller.dart';
import 'package:livescore/screen/home/admin/components/admin_news_item.dart';

import 'package:livescore/widgets/date_fields.dart';
import 'package:livescore/widgets/text_fields.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({super.key});

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
                            child: AppTextField(
                                controller: controller.imageController,
                                text: 'Image Link',
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
                                  if (controller
                                          .nameController.text.isNotEmpty &&
                                      controller.descriptionController.text
                                          .isNotEmpty &&
                                      controller
                                          .imageController.text.isNotEmpty &&
                                      controller
                                          .dateController.text.isNotEmpty) {
                                    Map<String, dynamic> data = {
                                      'name': controller.nameController.text,
                                      'description':
                                          controller.descriptionController.text,
                                      'img': controller.imageController.text,
                                      'date': controller.dateController.text
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
                              img: article.data["img"].toString(),
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
