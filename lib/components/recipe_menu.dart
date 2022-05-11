import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  final lang;
  final index;

  RecipeMenu(this.lang, this.index);

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, String>> menuList = [{'icon':'Icons.airplane_ticket', "menu":"항공"}, {"icon":'Icons.tour_rounded', "menu":"여행"}];
    //  print(menuList[0]);
    //  print(menuList[0]['menu']);

    if (lang == '내국인') {
      return Padding(
//        padding: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // 위젯 사이 공간 동일하게 만들기
              children: [
                if (index == '항공') ...[
                  _buildMenuItem(Icons.airplane_ticket, '항공', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.tour_rounded, '여행', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.local_convenience_store, '편의', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.map, '지도', index),
                ],
                if (index == '여행') ...[
                  _buildMenuItem(Icons.airplane_ticket, '항공', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.tour_rounded, '여행', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.local_convenience_store, '편의', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.map, '지도', index),
                ],
                if (index == '편의') ...[
                  _buildMenuItem(Icons.airplane_ticket, '항공', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.tour_rounded, '여행', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.local_convenience_store, '편의', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.map, '지도', index),
                ],
                if (index == '지도') ...[
                  _buildMenuItem(Icons.airplane_ticket, '항공', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.tour_rounded, '여행', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.local_convenience_store, '편의', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.map, '지도', index),
                ],
                if (index == '기타') ...[
                  _buildMenuItem(Icons.edgesensor_high_rounded, '기타', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.tour_rounded, '여행', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.local_convenience_store, '편의', index),
                  SizedBox(width: 25),
                  _buildMenuItem(Icons.map, '지도', index),
                ],
              ],
            ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
            //   children: [
            //     _buildMenuItem(Icons.all_inbox, "지도"),
            //     SizedBox(width: 25),
            //     _buildMenuItem(Icons.airplane_ticket, "통역"),
            //     SizedBox(width: 25),
            //     _buildMenuItem(Icons.tour_rounded, "기타"),
            //     SizedBox(width: 25),
            //     _buildMenuItem(Icons.local_convenience_store, "편의시설"),
            //   ],
            // )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
          children: [
            if (index == '항공') ...[
              _buildMenuItem(Icons.airplane_ticket, 'airplane', 'airplane'),
              SizedBox(width: 25),
              _buildMenuItem(Icons.tour_rounded, 'tour', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.local_convenience_store, 'CS', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.map, 'map', index),
            ],
            if (index == '여행') ...[
              _buildMenuItem(Icons.airplane_ticket, 'airplane', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.tour_rounded, 'tour', 'tour'),
              SizedBox(width: 25),
              _buildMenuItem(Icons.local_convenience_store, 'CS', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.map, 'map', index),
            ],
            if (index == '편의') ...[
              _buildMenuItem(Icons.airplane_ticket, 'airplane', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.tour_rounded, 'tour', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.local_convenience_store, 'CS', 'CS'),
              SizedBox(width: 25),
              _buildMenuItem(Icons.map, 'map', index),
            ],
            if (index == '지도') ...[
              _buildMenuItem(Icons.airplane_ticket, 'airplane', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.tour_rounded, 'tour', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.local_convenience_store, 'CS', index),
              SizedBox(width: 25),
              _buildMenuItem(Icons.map, 'map', 'map'),
            ],
          ],
        ),
      );
    }
  }

  Widget _buildMenuItem(IconData mIcon, String text, String param) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (param == text) ...[
            Icon(mIcon, color: Colors.redAccent, size: 30),
          ] else ...[
            Icon(mIcon, color: Colors.blue, size: 30)
          ],
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
