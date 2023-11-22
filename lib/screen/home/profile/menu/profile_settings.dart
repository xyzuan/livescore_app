import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/auth/auth_controller.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authController.logout();
      },
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: const ShapeDecoration(
                              color: Color(0xFF222232), shape: CircleBorder()),
                          child: Icon(
                            IconlyBold.logout,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: AppFonts().primaryFont,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          Text(
                            "Log out this user in this application",
                            style: TextStyle(
                              color: const Color(0xFFC4C4C4),
                              fontSize: 14,
                              fontFamily: AppFonts().primaryFont,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      IconlyLight.arrow_right_2,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.fromLTRB(76, 0, 42, 0),
                decoration: const BoxDecoration(color: Color(0xFF222232)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
