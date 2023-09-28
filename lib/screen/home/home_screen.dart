import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/screen/home/dashboard/dashboard_screen.dart';
import 'package:livescore/screen/home/home_controller.dart';

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
              children: [
                DashboardPage(),
                DashboardPage(),
                DashboardPage(),
                DashboardPage(),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 96,
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF222232),
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              selectedIconTheme: IconThemeData(color: Color(0xFF246BFD)),
              unselectedIconTheme: IconThemeData(color: Color(0xFF65656B)),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              elevation: 8,
              items: [
                _bottomNavigationBarItem(
                  icon: IconlyLight.home,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: IconlyLight.discovery,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: IconlyLight.chart,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: IconlyLight.profile,
                  label: 'Home',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

_bottomNavigationBarItem({IconData? icon, String? label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
