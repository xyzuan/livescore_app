import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/colors.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/constant/sports.dart';
import 'package:livescore/screen/home/explore/components/news_item.dart';
import 'package:livescore/screen/home/explore/explore_controller.dart';
import 'package:livescore/widgets/category_card.dart';
import 'package:livescore/widgets/text_fields.dart';

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
        children: [
          AppTextField(
              text: 'Search for news, team, match, etc...',
              icon: IconlyLight.search,
              color: hexToColor('#222232')),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
                height: 58,
                child: ListView.builder(
                  itemCount: sportList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final categoryName = sportList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleCategorySelection(index);
                        },
                        child: CategoryCard(
                          categoryName: categoryName,
                          isSelected: controller.selectedIndex == index,
                          horizontal: true,
                        ),
                      );
                    });
                  },
                )),
          ),
          Container(
            height: null,
            child: Obx(
              () => controller.db.articles.isNotEmpty == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.db.articles.length,
                      itemBuilder: (context, index) {
                        final article = controller.db.articles[index];
                        return NewsItem(
                          headline: article.data["name"].toString(),
                          date: article.data["date"].toString(),
                          imgId: article.data["imgId"].toString(),
                          body: article.data["description"].toString(),
                          externalLink: article.data["img"].toString(),
                        );
                      },
                    )
                  : Center(
                      child: Text('No articles available'),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 18, 8.0, 18),
            child: Text(
              'Trending News',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: AppFonts().primaryFont,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
