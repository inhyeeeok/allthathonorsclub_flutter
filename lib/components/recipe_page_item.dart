import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:allthathonorsclub_demo1/components/recipe_menu.dart';
import 'package:allthathonorsclub_demo1/components/recipe_title.dart';

class RecipePageItem extends StatelessWidget {
  // final String imageName;
  // final String title;

  final classData;
  const RecipePageItem(this.classData);

  //const RecipePageItem(this.imageName, this.title);

  @override
  Widget build(BuildContext context) {
    print("Test1");
    print(this.classData);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
       // child: ListView(
       //   children: [
       //     RecipeMenu(),
       //     ListView.builder(
       //     itemCount : classData.length,
       //         itemBuilder : (BuildContext context, int index){
       //           return Container(
       //             child: RecipeListItem(classData[index]),
       //           );
       //         }
       //   )
       //   ],

      child: ListView.builder(
        itemCount : classData.length + 1,
        itemBuilder : (BuildContext context, int index){
          if(index ==0) return RecipeMenu();
          return Container(
            child: RecipeListItem(classData[index-1]),
          );
        }
       ),
    );
  }
}