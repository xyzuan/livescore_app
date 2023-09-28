import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/screen/home/explore/explore_controller.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({super.key});

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
        children: const <Widget>[
          Text(
            'Explore Page',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
