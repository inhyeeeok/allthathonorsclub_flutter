import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';

import '../components/recipe_list_item.dart';
import '../components/recipe_menu.dart';

class RecipePage extends StatelessWidget {
  final classData;
  final lang;

  RecipePage(this.classData, this.lang);

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
            // RecipeMenu(lang, '여행'),
             RecipePageItem(classification("여행"), lang, '여행'),
             RecipePageItem(classification("교통"), lang, '교통'),
             RecipePageItem(classification("생활정보"), lang, '생활정보'),
             RecipePageItem(classification("뉴스"), lang, '뉴스'),
             RecipePageItem(classification("쇼핑"), lang, '쇼핑'),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: _buildRecipeAppBar(lang),
    //   // drawer: _buildRecipeEndDrawer(lang),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: new Column(children: <Widget>[
    //       // RecipeMenu(lang, '여행'),
    //       Expanded(
    //           child: Container(
    //             color: const Color.fromRGBO(235, 241, 243, 1.0),
    //             child: PageView(
    //               controller: controller,
    //               scrollDirection: Axis.horizontal,
    //               children: [
    //                 // RecipeMenu(lang, '여행'),
    //                 RecipePageItem(classification("여행"), lang, '여행'),
    //                 RecipePageItem(classification("교통"), lang, '교통'),
    //                 RecipePageItem(classification("생활정보"), lang, '생활정보'),
    //                 RecipePageItem(classification("뉴스"), lang, '뉴스'),
    //                 RecipePageItem(classification("쇼핑"), lang, '쇼핑'),
    //               ],
    //             ),
    //           )
    //       ),
    //       // Expanded(child: RecipePageItem(classification("여행"), lang, '여행')),
    //     ]),
    //   ),
    // );
    //   body: Column(
    //     children: [
    //       Container(
    //         color: Colors.white,
    //         height: 100,
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: new Column(children: <Widget>[
    //             RecipeMenu(lang, '여행'),
    //           ]),
    //         ),
    //       ),
    //       Container(
    //           color: Colors.white,
    //           height: 5,
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10),
    //             child: new Column(children: <Widget>[
    //               Expanded(
    //                 child: PageView(
    //                   controller: controller,
    //                   scrollDirection: Axis.horizontal,
    //                   children: [
    //                     Row(
    //                       children: <Widget>[
    //                         Container(
    //                           width: 60,
    //                           height: 80,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(0),
    //                             border: Border.all(color: Colors.black12),
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 60,
    //                           height: 80,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(0),
    //                             border: Border.all(color: Colors.black12),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: <Widget>[
    //                         Image(
    //                           image: AssetImage(
    //                               'assets/images/menu/icon_menu_trans.png'),
    //                           fit: BoxFit.fitHeight,
    //                         ),
    //                         Image(
    //                           image: AssetImage(
    //                               'assets/images/menu/icon_menu_trans.png'),
    //                           fit: BoxFit.fitHeight,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ]),
    //           )),
    //       Expanded(
    //         child: Container(
    //           color: const Color.fromRGBO(235, 241, 243, 1.0),
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10),
    //             child: new Column(children: <Widget>[
    //               Expanded(
    //                   child: RecipePageItem(classData, lang, '여행')),
    //           // child: RecipePageItem(classification("여행"), lang, '여행')),
    //             ]),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  classification(data) {
    List<Map<String, String>> returnData = [];

    classData.forEach((i) {
      if (i["kinds"] == data) {
        returnData.add(i);
      }
    });

    return returnData;
  }

  // Drawer _buildRecipeEndDrawer(String lang) {
  //   var title = (lang == '내국인') ? '올댓아너스 클럽' : 'HONORS CLUB';
  //
  //   return Drawer(
  //     child: ListView(
  //       children: [
  //         Container(
  //           height: 65,
  //           child: DrawerHeader(
  //             decoration: BoxDecoration(color: Colors.lightGreen),
  //             child: Text(title,
  //                 style: TextStyle(
  //                     color: Colors.white70,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold)),
  //           ),
  //         ),
  //         ListTile(
  //           title: const Text('언어 전환'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           title: const Text('관리자'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           title: const Text('앱 버전'),
  //           onTap: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
