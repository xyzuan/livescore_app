import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isAdmin;

  const AppNavigationBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.isAdmin});

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
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SizedBox(
            child: CupertinoTabBar(
              backgroundColor: Colors.transparent,
              onTap: onTap,
              currentIndex: currentIndex,
              activeColor: Color.fromARGB(255, 60, 125, 255),
              inactiveColor: const Color(0xFF65656B),
              items: [
                _bottomNavigationBarItem(
                  icon: currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
                ),
                _bottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? IconlyBold.discovery
                      : IconlyLight.discovery,
                ),
                _bottomNavigationBarItem(
                  icon:
                      currentIndex == 2 ? IconlyBold.chart : IconlyLight.chart,
                ),
                _bottomNavigationBarItem(
                  icon: currentIndex == 3
                      ? IconlyBold.profile
                      : IconlyLight.profile,
                ),
                if (isAdmin)
                  _bottomNavigationBarItem(
                    icon:
                        currentIndex == 4 ? IconlyBold.edit : IconlyLight.edit,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_bottomNavigationBarItem({IconData? icon}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
  );
}
