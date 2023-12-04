import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:livescore/constant/colors.dart';
import 'package:livescore/screen/home/standings/standings_controller.dart';
import 'package:livescore/widgets/category_card.dart';
import 'package:livescore/widgets/text_fields.dart';

import '../../../constant/sports.dart';

class StandingsPage extends GetView<StandingsController> {
  const StandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181829),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 32,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          AppTextField(
              text: 'Search your competition',
              icon: IconlyLight.search,
              color: hexToColor('#222232')),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
                height: 58,
                child: ListView.builder(
                  itemCount: sportList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final categoryName = sportList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleCategorySelection(index);
                        },
                        child: CategoryCard(
                          categoryName: categoryName,
                          isSelected: controller.selectedIndex == index,
                          horizontal: true,
                        ),
                      );
                    });
                  },
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.imageController,
                  decoration: InputDecoration(
                    labelText: 'Enter your image',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.dateController,
                  decoration: InputDecoration(
                    labelText: 'Enter your date',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      // Handle the selected date here, you can update the controller or perform other actions
                      controller.dateController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (controller.nameController.text.isNotEmpty) {
                      Map<String, dynamic> data = {
                        'name': controller.nameController.text,
                        'description': controller.descriptionController.text,
                        'img': controller.imageController.text,
                        'date': controller.dateController.text
                      };
                      controller.inputSoccer(data);
                    } else {
                      Get.snackbar(
                        'Input Error',
                        'Name cannot be empty',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Text('Store Name'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
