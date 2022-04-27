import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_menu.dart';
import 'package:allthathonorsclub_demo1/components/recipe_title.dart';

class RecipePage extends StatelessWidget {

   final classData;
   final lang;
   RecipePage(this.classData, this.lang);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
    PageController(initialPage: 0, viewportFraction: 1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(lang),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
             RecipePageItem(classification("항공"), lang, '항공'),
             RecipePageItem(classification("여행"), lang, '여행'),
             RecipePageItem(classification("편의"), lang, '편의'),
             RecipePageItem(classification("지도"), lang, '지도'),
          ],
        ),
      ),
    );
  }

  classification(data) {
    var returnData = [];

    for (int i = 0; i < classData.length; i++) {
      if(classData[i]["kinds"] == data){
        returnData.add(classData[i]);
      }
    }
    return returnData;
  }
  
  AppBar _buildRecipeAppBar(String lang) {
    var title = (lang=='내국인')?'올댓아너스 클럽':'HONORS CLUB';

    return AppBar(
      backgroundColor: Colors.lightGreen,
      title: Container(
        margin: EdgeInsets.only(left: 45.0),
        // margin: EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Text(title,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
    );
  }
}