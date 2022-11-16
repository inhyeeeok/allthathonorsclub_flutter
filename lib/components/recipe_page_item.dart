import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_menu.dart';

class RecipePageItem extends StatelessWidget {

  final classData;
  final lang;
  final pageIndex;
  const RecipePageItem(this.classData, this.lang, this.pageIndex);

  @override
  Widget build(BuildContext context) {

    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 20),
    //   child: ListView.builder(
    //       // itemCount: classData.length + 1,
    //       itemCount: 1,
    //       itemBuilder: (BuildContext context, int index) {
    //         // if (index == 0) return Text('여행');
    //         return Container(
    //             child: new Column(children: <Widget>[
    //           Text(
    //             '여행',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           RecipeListItem(classification('여행')),
    //           Text(
    //             '교통',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           RecipeListItem(classification('교통')),
    //           Text(
    //             '생활정보',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           RecipeListItem(classification('생활정보')),
    //           Text(
    //             '뉴스',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           RecipeListItem(classification('뉴스')),
    //           Text(
    //             '쇼핑',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           RecipeListItem(classification('쇼핑')),
    //         ]));
    //
    //         // return RecipeListItem(classData[index - 1]);
    //         // return RecipeListItem(classData[0]);
    //       }),
    // );


    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
          // itemCount: classData.length + 1,
          itemCount: 2, //첫번째일땐 메뉴, 2번째일땐 리스트
          itemBuilder: (BuildContext context, int index) {
            // if (index == 0) return Text(pageIndex);
            if (index == 0)
              return Container(
                  color: Colors.white,
                  child: new Column(children: <Widget>[
                    RecipeMenu(lang, pageIndex),
                  ]));
            return Container(
                color: const Color.fromRGBO(235, 241, 243, 1.0),
                child: new Column(children: <Widget>[
                  RecipeListItem(classData),
                ]));
            // return RecipeListItem(classData[index-1]);
          }),
    );
  }
}