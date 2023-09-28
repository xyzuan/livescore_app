import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class dashboardCategoryCard extends StatelessWidget {
  final String categoryName;
  final bool isSelected;

  const dashboardCategoryCard({
    super.key,
    required this.categoryName,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
      child: Container(
        width: 130,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.68, -0.74),
            end: Alignment(-0.68, 0.74),
            colors: isSelected
                ? [Color(0xFFF4A58A), Color(0xFFED6B4E)]
                : [Color(0xFF222232), Color(0xFF222232)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/images/${categoryName.toLowerCase()}_icon.png'),
              SizedBox(height: 8),
              Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: AppFonts().primaryFont,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
