import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_menu.dart';

class RecipePageItem1 extends StatelessWidget {

  final classData;
  final lang;
  final pageIndex;
  const RecipePageItem1(this.classData, this.lang, this.pageIndex);

  @override
  Widget build(BuildContext context) {

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
                    // RecipeMenu(lang, pageIndex, classData),
                  ]));
            return Container(
                color: const Color.fromRGBO(235, 241, 243, 1.0),
                child: new Column(children: <Widget>[
                  RecipeListItem(classification(pageIndex)),
                ]));
            // return RecipeListItem(classData[index-1]);
          }),
    );
  }

  classification(data) {
    List<Map<String, String>> returnData = [];

    for(var i=0; i <classData[data].length; i++) {
      returnData.add(Map<String, String>.from(classData[data][i]));
    }

    return returnData;
  }
}