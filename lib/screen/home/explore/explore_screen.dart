import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/screen/home/explore/explore_controller.dart';

class ExplorePage extends GetView<ExploreController> {
  ExplorePage({super.key});

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
          Text(
            'Explore Page',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
