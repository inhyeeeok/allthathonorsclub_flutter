import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 패키지


class RecipeListItem extends StatelessWidget {

  final classData;
  const RecipeListItem(this.classData);

  @override
  Widget build(BuildContext context) {
    // final String imageName = classData['img'];            //이미지 경로
    // final String description = classData['description'];
    // final String title = classData['item'];

    return Container(
      margin: const EdgeInsets.only(left: 15, top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < classData.length; i+=3) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // 위젯 사이 공간 동일하게 만들기
              children: [
                _buildMenuItem(classData[i]['img'], classData[i]['item'], classData[0]['url'], context),
                SizedBox(width: 5, height: 120),
                if (i + 1 < classData.length) ...[
                  _buildMenuItem(classData[i + 1]['img'], classData[i + 1]['item'], classData[0]['url'], context),
                  SizedBox(width: 5, height: 120),
                ] else ...[
                  SizedBox(width: MediaQuery.of(context).size.width*0.2, height: 120),
                ],
                if (i + 2 < classData.length) ...[
                  _buildMenuItem(classData[i + 2]['img'], classData[i + 2]['item'], classData[0]['url'], context),
                  SizedBox(width: 5, height: 120),
                ] else ...[
                  SizedBox(width: 100, height: 120),
                ]
              ],
            ),
          ]


          // Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
          //    children: [
          //      _buildMenuItem(imageName, title, '여행'),
          //      SizedBox(width: 5),
          //      _buildMenuItem(imageName, '교통', '여행'),
          //      SizedBox(width: 5),
          //      _buildMenuItem(imageName, '생활정보', '여행'),
          //      SizedBox(width: 5),
          //    ],
          //  ),

         ],
      ),
    );
  }

  Widget _buildMenuItem(String mIcon, String text, String url, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.21,
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        // border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child:
            InkWell(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // child: Image.asset(
                  //   mIcon,
                  //   fit: BoxFit.cover,
                  // ),
                  child: Image.network(
                    mIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                launchURL("https://www.naver.com");
              },
            ),
          ),
          Container(
            height: 60,
            child:
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(text,
                  style: TextStyle(color: Colors.black87),
                  textAlign: TextAlign.center),
            )
          ),
          // if (param == text) ...[
          //
          // ] else ...[
          //
          // ],

          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Text(text,
          //       style: TextStyle(color: Colors.black87),
          //       textAlign: TextAlign.center),
          // )
          // Text(
          //   text,
          //   style: TextStyle(color: Colors.black87),
          // ),
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