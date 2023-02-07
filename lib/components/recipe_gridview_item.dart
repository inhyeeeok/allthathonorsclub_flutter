import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipePageItem extends StatefulWidget {
  final classData1;
  final lang1;
  final pageIndex1;

  RecipePageItem(this.classData1, this.lang1, this.pageIndex1);

  @override
  _GridViewItem createState() => _GridViewItem(classData1, lang1, pageIndex1);
}

class _GridViewItem extends State<RecipePageItem> {
  final classData;
  final lang;
  final pageIndex;

  _GridViewItem(this.classData, this.lang, this.pageIndex);

  @override
  Widget build(BuildContext context) {
    var listData = classification(pageIndex);

    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      child: GridView.builder(
        itemCount: listData.length, //item 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 0, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (context, int index) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          listData!.elementAt(index)['img']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      launchURL(listData!.elementAt(index)['url']!);
                    },
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(listData!.elementAt(index)['item']!,
                      style: TextStyle(
                        color: Colors.black87,
                        // fontSize: 15
                      ),
                      textAlign: TextAlign.center),
                )),
              ],
            ),
          );
        },
      ),
    );
  }

  classification(data) {
    List<Map<String, String>> returnData = [];

    for (var i = 0; i < classData[data].length; i++) {
      returnData.add(Map<String, String>.from(classData[data][i]));
    }

    returnData.sort((a, b) => int.parse(a['seq']!).compareTo(int.parse(b['seq']!)));

    return returnData;
  }

  void launchURL(String targetUrl) async {
    var url = Uri.parse(targetUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }else {
      throw '$url';
    }
  }
}
