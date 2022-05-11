import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 패키지


class RecipeListItem extends StatelessWidget {

  final classData;
  const RecipeListItem(this.classData);

  @override
  Widget build(BuildContext context) {
    final String imageName = classData['img'];            //이미지 경로
    final String description = classData['description'];
    final String title = classData['item'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Image.asset(
                //   "assets/images/$imageName",
                //   fit: BoxFit.cover,
                // ),
                child: Image.network(
                  "https://picsum.photos/250?image=9",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              launchURL(classData['url']);
            },
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

  void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      throw '$url';
    }
  }
}