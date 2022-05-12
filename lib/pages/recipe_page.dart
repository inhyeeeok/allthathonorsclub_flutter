import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';

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
      drawer: _buildRecipeEndDrawer(lang),
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
             RecipePageItem(classification("기타"), lang, '기타'),
          ],
        ),
      ),
    );
  }

  classification(data) {
    List<Map<String, String>> returnData = [];

    classData.forEach((i) {
      if(i["kinds"] == data){ returnData.add(i); }
    });

    return returnData;
  }

   Drawer _buildRecipeEndDrawer(String lang) {
    var title = (lang=='내국인')?'올댓아너스 클럽':'HONORS CLUB';

    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 65,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightGreen),
              child: Text(title,
                style: TextStyle(color: Colors.white70, fontSize: 20,
                    fontWeight: FontWeight.bold)
              ),
            ),
          ),
          ListTile(
            title: const Text('언어 전환'),
            onTap: () {

            },
          ),
          ListTile(
            title: const Text('관리자'),
            onTap: () {

            },
          ),
          ListTile(
            title: const Text('앱 버전'),
            onTap: () {

            },
          ),
        ],
      ),
    );
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