import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/dashboard/components/dashboard_card.dart';
import 'package:livescore/screen/home/dashboard/components/dashboard_category_card.dart';
import 'package:livescore/screen/home/dashboard/components/dashboard_item_card.dart';
import 'package:livescore/screen/home/dashboard/dashboard_controller.dart';
import 'package:livescore/widgets/item_headers.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  // final AuthController authController = Get.put(AuthController());

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
          Row(
            children: [
              Text(
                'LiveScore',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts().primaryFont,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                icon: const Icon(IconlyLight.search),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(IconlyLight.notification),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
            child: dashboardCard(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final categoryName = controller.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleCategorySelection(index);
                        },
                        child: dashboardCategoryCard(
                          categoryName: categoryName,
                          isSelected: controller.selectedIndex == index,
                        ),
                      );
                    });
                  },
                )),
          ),
          const Column(children: [
            itemHeaders(
              leagueName: 'La Liga',
              region: 'Spain',
            ),
            dashboardItemCard(
              status: 'ht',
              teamOne: 'Barcelona',
              scoreOne: 2,
              teamTwo: 'Real Madrid',
              scoreTwo: 0,
            ),
          ]),
          const Column(children: [
            itemHeaders(
              leagueName: 'Premier League',
              region: 'England',
            ),
            dashboardItemCard(
                status: 'ht',
                teamOne: 'Aston Villa',
                scoreOne: 2,
                teamTwo: 'Liverpool',
                scoreTwo: 3),
            dashboardItemCard(
                status: 'ft',
                teamOne: 'Aston Villa',
                scoreOne: 2,
                teamTwo: 'Liverpool',
                scoreTwo: 3),
          ])
        ],
      ),
    );
  }
}
