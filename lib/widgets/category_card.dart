import 'package:flutter/material.dart';
import 'package:livescore/constant/fonts.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final bool isSelected;
  final bool horizontal;

  const CategoryCard({
    super.key,
    required this.categoryName,
    this.isSelected = false,
    this.horizontal = false,
  });

  @override
  _DashboardCategoryCardState createState() => _DashboardCategoryCardState();
}

class _DashboardCategoryCardState extends State<CategoryCard> {
  Widget buildVertical() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: widget.isSelected ? 1.0 : 0.5,
      child: Container(
        width: 130,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.68, -0.74),
            end: const Alignment(-0.68, 0.74),
            colors: widget.isSelected
                ? [const Color(0xFFF4A58A), const Color(0xFFED6B4E)]
                : [const Color(0xFF222232), const Color(0xFF222232)],
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
                'assets/images/categories/${widget.categoryName.toLowerCase()}_icon.png',
                height: 52,
              ),
              const SizedBox(height: 8),
              Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: AppFonts().primaryFont,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorizontal() {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.isSelected ? 1.0 : 0.5,
        child: Container(
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.68, -0.74),
              end: const Alignment(-0.68, 0.74),
              colors: widget.isSelected
                  ? [const Color(0xFFF4A58A), const Color(0xFFED6B4E)]
                  : [const Color(0xFF222232), const Color(0xFF222232)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/categories/${widget.categoryName.toLowerCase()}_icon.png',
                  height: 32,
                ),
                if (widget.isSelected)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      widget.categoryName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: AppFonts().primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.horizontal == true ? buildHorizontal() : buildVertical();
  }
}
