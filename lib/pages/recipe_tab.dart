import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';

class RecipePage extends StatelessWidget {
  final classData;
  final lang;
  final menuIndex;

  RecipePage(this.classData, this.lang, this.menuIndex);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 1);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 241, 243, 1.0),
      appBar: _buildRecipeAppBar(lang),
      // drawer: _buildRecipeEndDrawer(lang),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            // if (menuIndex == '여행') ...[
            //   RecipePageItem(classData, lang, menuIndex),
            //   RecipePageItem(classData, lang, '교통'),
            //   RecipePageItem(classData, lang, '생활정보'),
            //   RecipePageItem(classData, lang, '뉴스'),
            //   RecipePageItem(classData, lang, '쇼핑'),
            // ] else if(menuIndex == '교통') ...[
            //   RecipePageItem(classData, lang, menuIndex),
            //   RecipePageItem(classData, lang, '여행'),
            //   RecipePageItem(classData, lang, '생활정보'),
            //   RecipePageItem(classData, lang, '뉴스'),
            //   RecipePageItem(classData, lang, '쇼핑'),
            // ] else ...[
            //   RecipePageItem(classData, lang, menuIndex),
            //   RecipePageItem(classData, lang, '교통'),
            //   RecipePageItem(classData, lang, '생활정보'),
            //   RecipePageItem(classData, lang, '뉴스'),
            //   RecipePageItem(classData, lang, '쇼핑'),
            // ],


            RecipePageItem1(classData, lang, menuIndex)

          ],
        ),
      ),
    );
  }

  AppBar _buildRecipeAppBar(String lang) {
    var title = (lang == '내국인') ? '올댓 아너스 클럽' : 'All that Honors Club';

    return AppBar(
      backgroundColor: const Color.fromRGBO(117, 148, 95, 1.0),
      title: Container(
        // margin: EdgeInsets.only(left: 45.0),
        margin: EdgeInsets.only(left: 0.0),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white70),
    );
  }
}
