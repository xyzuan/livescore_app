import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/screen/home/profile/components/profile_tab_list.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTabList(
          icon: IconlyLight.profile,
          title: 'Name',
          summary: 'Jody Yuantoro',
        ),
        ProfileTabList(
          icon: IconlyLight.message,
          title: 'Email',
          summary: 'xyzuannihboss@gmail.com',
        ),
        ProfileTabList(
          icon: IconlyLight.call,
          title: 'Phone',
          summary: '+62 812 789 567',
        ),
        ProfileTabList(
          icon: IconlyLight.location,
          title: 'Address',
          summary: 'Malang, Jawa Timur, Indonesia',
        )
      ],
    );
  }
}
