import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
   // final String imageName;
  // final String title;

  final classData;
  const RecipeListItem(this.classData);


  //const RecipeListItem(this.imageName, this.title);

  @override
  Widget build(BuildContext context) {
    print(classData);
    final String imageName = classData['img'];            //이미지 경로
    final String description = classData['description'];
    final String title = classData['item'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/$imageName",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            // "Have you ever made your own $title? Once you've tried a homemade $title, you'll never go back.",
            description,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}