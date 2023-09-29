import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/profile/components/profile_tab_list.dart';
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
              const ProfileView(),
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
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: const ProfileTabList(
                  icon: IconlyLight.profile,
                  title: 'Name',
                  summary: 'Jody Yuantoro',
                ),
              ),
              const ProfileTabList(
                icon: IconlyLight.message,
                title: 'Email',
                summary: 'xyzuannihboss@gmail.com',
              ),
              const ProfileTabList(
                icon: IconlyLight.call,
                title: 'Phone',
                summary: '+62 812 789 567',
              ),
              const ProfileTabList(
                icon: IconlyLight.location,
                title: 'Address',
                summary: 'Malang, Jawa Timur, Indonesia',
              )
            ],
          )
        ],
      ),
    );
  }
}
