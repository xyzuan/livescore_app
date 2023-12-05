import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/screen/home/admin/admin_screen.dart';
import 'package:livescore/screen/home/dashboard/dashboard_screen.dart';
import 'package:livescore/screen/home/explore/explore_screen.dart';
import 'package:livescore/screen/home/home_controller.dart';
import 'package:livescore/screen/home/profile/profile_screen.dart';
import 'package:livescore/screen/home/standings/standings_screen.dart';
import 'package:livescore/widgets/navigation_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: const [
                  DashboardPage(),
                  ExplorePage(),
                  StandingsPage(),
                  ProfilePage(),
                  AdminPage()
                ],
              ),
            ),
            bottomNavigationBar: AppNavigationBar(
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              isAdmin: controller.isAdmin,
            ));
      },
    );
  }
}
