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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),

      child: ListView.builder(
        itemCount : classData.length + 1,
        itemBuilder : (BuildContext context, int index){
          if(index ==0) return RecipeMenu(lang, pageIndex);
          return Container(
            child: RecipeListItem(classData[index-1]),
          );
        }
       ),
    );
  }
}