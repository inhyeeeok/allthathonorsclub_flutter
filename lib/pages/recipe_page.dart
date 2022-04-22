import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_menu.dart';
import 'package:allthathonorsclub_demo1/components/recipe_title.dart';

class RecipePage extends StatelessWidget {

  //Map<String, String> menuMap = {};
  var menuMap = [
    {"item": "올댓아너스클럽", "kinds": "기타", "url": "", "img": "", "description":"1"},
    {"item": "싸이버스카이", "kinds": "항공", "url": "", "img": "group/korea_air_skyshop.png", "description":"싸이버 스카이 서비스"},
    {"item": "대한민국 구석구석", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "도시 고속도로", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "대한항공", "kinds": "항공", "url": "", "img": "group/korea_air.png", "description":"대한항공 서비스"},
    {"item": "토파스여행정보", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "파파택시", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "고속도로교통정보", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "진에어", "kinds": "항공", "url": "", "img": "group/jinair.png", "description":"진에어"},
    {"item": "트립코디", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "서울 지하철 노선도", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "계산기", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "한진관광", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "한국관광공사", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "서울버스", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "파파고", "kinds": "통역", "url": "", "img": "", "description":""},
    {"item": "티맵", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "말랑말랑 지니톡", "kinds": "통역", "url": "", "img": "", "description":""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView(
          children: [
             RecipePageItem(classification("항공")),
             RecipePageItem(classification("여행")),
             RecipePageItem(classification("편의")),
             // RecipePageItem({"group/korea_air_skyshop.png", "Made Coffee"}),
             // RecipeListItem("burger", "Made Burger"),
             // RecipeListItem("pizza", "Made Pizza"),
          ],
        ),
      ),
    );
  }

  classification(data) {
    // print(menuMap);
    // menuMap[1].forEach((String key, String value) {
    //   print('$key, I like $value');
    // });
    var returnData = [];

    for (int i = 0; i < menuMap.length; i++) {
      // print(i);
      // print(menuMap[i]);
      // if(menuMap[i]["kinds"] == "편의"){
      //   print(menuMap[i]["kinds"]);
      //   returnData.addAll(menuMap[i]);
      // }

      if(menuMap[i]["kinds"] == data){

        // returnData = {...menuMap[i]};
        returnData.add(menuMap[i]);
      }

      // menuMap[i].forEach((key, value) {
      //   print(i);
      //   print(key);
      // });
    }

    print(returnData);

    // menuMap.where((e) => true).forEach();

    // returnData = [
    //   {"item": "싸이버스카이", "kinds": "항공", "url": "", "img": "group/korea_air_skyshop.png", "description":"싸이버 스카이 서비스"},
    //   {"item": "대한항공", "kinds": "항공", "url": "", "img": "group/korea_air.png", "description":"대한항공 서비스"}
    // ];
    return returnData;
  }
  
  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Text("올댓아너스 앱 목업 디자인",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Icon(Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 25.0
              ),
            )
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