import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livescore/screen/home/profile/profile_controller.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  File? pickedFile;
  ProfileController profileController = Get.put(ProfileController());
  ImagePicker imagePicker = ImagePicker();

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      Get.snackbar(
        "Image Pick Canceled",
        "You canceled image selection",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      if (kDebugMode) {
        print("Image pick operation canceled by the user.");
      }

      return;
    }

    pickedFile = File(pickedImage.path);
    profileController.setProfileImagePath(pickedFile!.path);

    Get.back();

    Get.snackbar(
      "Image Pick Successfully",
      "You success change image",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    if (kDebugMode) {
      print(pickedFile);
    }
  }

  ProfileView({
    super.key,
    this.pickedFile,
  });

  @override
  Widget build(BuildContext context) {
    ProfileController imageController = Get.put(ProfileController());

    return Stack(children: [
      Obx(
        () => CircleAvatar(
          radius: 80,
          backgroundColor: Color(0xFF222232),
          backgroundImage: profileController.isProficPicPathSet.value == true
              ? FileImage(File(profileController.profilePicPath.value))
                  as ImageProvider
              : AssetImage("assets/images/dummy/jody.png"),
        ),
      ),
      GestureDetector(
        onTap: () => takePhoto(ImageSource.gallery),
        child: Positioned(
          bottom: 0,
          right: 0,
          child: Stack(alignment: Alignment.center, children: [
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
          ]),
        ),
      )
    ]);
  }
}
