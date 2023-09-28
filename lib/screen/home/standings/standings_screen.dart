import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/screen/home/standings/standings_controller.dart';

class StandingsPage extends GetView<StandingsController> {
  const StandingsPage({super.key});

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
            'Standings Page',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
