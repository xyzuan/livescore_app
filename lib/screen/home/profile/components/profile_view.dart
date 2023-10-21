import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livescore/screen/home/profile/profile_controller.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final File? pickedFile;

  ProfileView({Key? key, this.pickedFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          bool isImagePathAvailable = controller.isProficPicPathSet.value;
          String imagePath = controller.profilePicPath.value;

          ImageProvider<Object>? backgroundImage;
          if (isImagePathAvailable) {
            backgroundImage = FileImage(File(imagePath));
          } else {
            backgroundImage = AssetImage("assets/images/dummy/jody.png");
          }

          return CircleAvatar(
              radius: 80,
              backgroundColor: Color(0xFF222232),
              backgroundImage: backgroundImage);
        }),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFF222232),
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                      child: Row(children: [
                        IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              await controller.takePhoto(
                                  ImageSource.gallery, pickedFile);
                            },
                            icon: Icon(IconlyBold.image)),
                        IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              await controller.takePhoto(
                                  ImageSource.camera, pickedFile);
                            },
                            icon: Icon(IconlyBold.camera))
                      ]),
                    ),
                  );
                });
          },
          child: Positioned(
            bottom: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.68, -0.74),
                      end: Alignment(-0.68, 0.74),
                      colors: [Color(0xFFF4A58A), Color(0xFFED6B4E)],
                    ),
                    shape: OvalBorder(
                      side: BorderSide(width: 2, color: Color(0xFF181829)),
                    ),
                  ),
                ),
                const Icon(
                  IconlyLight.edit,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
