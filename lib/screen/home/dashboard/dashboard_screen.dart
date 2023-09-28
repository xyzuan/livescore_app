import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/home/dashboard/components/dashboard_card.dart';
import 'package:livescore/screen/home/dashboard/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({super.key});

  // final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181829),
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
              Expanded(child: SizedBox()),
              IconButton(
                icon: Icon(IconlyLight.search),
                color: Colors.white,
                onPressed: () {
                  print('IconButton pressed!');
                },
              ),
              IconButton(
                icon: Icon(IconlyLight.notification),
                color: Colors.white,
                onPressed: () {
                  print('IconButton pressed!');
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
            child: dashboardCard(),
          )
        ],
      ),
    );
  }
}
