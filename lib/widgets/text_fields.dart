import 'package:flutter/material.dart';

Widget AppTextField() {
  return Container(
    width: 327,
    height: 64,
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 327,
            height: 64,
            decoration: ShapeDecoration(
              color: Color(0xFF181829),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          left: 48,
          top: 23,
          child: Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF65656B),
              fontSize: 14,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 20,
          child: Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/20x18"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 48,
          top: 20,
          child: Container(
            width: 250, // Adjust the width according to your layout
            height: 24,
            child: TextField(
              style: TextStyle(color: Colors.white), // Customize text color
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white60),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
