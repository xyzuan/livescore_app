import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  AppNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: CupertinoTabBar(
            backgroundColor: Colors.transparent,
            onTap: onTap,
            currentIndex: currentIndex,
            activeColor: Color(0xFF246BFD),
            inactiveColor: Color(0xFF65656B),
            items: [
              _bottomNavigationBarItem(
                icon: IconlyLight.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: IconlyLight.discovery,
                label: 'Explore',
              ),
              _bottomNavigationBarItem(
                icon: IconlyLight.chart,
                label: 'Standings',
              ),
              _bottomNavigationBarItem(
                icon: IconlyLight.profile,
                label: 'My Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_bottomNavigationBarItem({IconData? icon, String? label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
