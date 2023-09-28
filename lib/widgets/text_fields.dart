import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

Widget appTextField({required String text, required IconData icon}) {
  return Card(
    color: const Color(0xFF181829),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: SizedBox(
      height: 64,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            style: TextStyle(
                color: Colors.white, fontFamily: AppFonts().primaryFont),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: const Color(0xFF65656B),
                ),
                hintText: text,
                hintStyle: const TextStyle(color: Color(0xFF65656B)),
                border: InputBorder.none),
          ))
        ],
      ),
    ),
  );
}
