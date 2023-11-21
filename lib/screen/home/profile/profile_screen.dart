import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/profile/menu/profile_activity.dart';
import 'package:livescore/screen/home/profile/menu/profile_info.dart';
import 'package:livescore/screen/home/profile/menu/profile_settings.dart';
import 'package:livescore/screen/home/profile/profile_controller.dart';
import 'package:livescore/widgets/item_tab.dart';

import 'components/profile_view.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileView(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Jody Yuantoro',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts().primaryFont,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '#selesaiTuEmyu 🔥',
                      style: TextStyle(
                          color: const Color(0xFFC4C4C4),
                          fontFamily: AppFonts().primaryFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final profileTab = controller.profileTab[index];
                        return GestureDetector(
                          onTap: () {
                            controller.handleTabSelection(index);
                          },
                          child: ItemTab(
                            tabName: profileTab,
                            isSelected: controller.selectedIndex == index,
                          ),
                        );
                      });
                    },
                  )),
              Container(
                height: 600,
                child: Obx(() =>
                    ListView(padding: EdgeInsets.only(top: 24), children: [
                      Container(
                        child: IndexedStack(
                          index: controller.selectedIndex.toInt(),
                          children: [
                            ProfileInfo(),
                            ProfileActivity(),
                            ProfileSettings()
                          ],
                        ),
                      ),
                    ])),
              ),
            ],
          )
        ],
      ),
    );
  }
}
