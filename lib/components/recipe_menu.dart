import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  final lang;
  final krIndex;

  RecipeMenu(this.lang, this.krIndex);

  @override
  Widget build(BuildContext context) {

    if (lang == '내국인') {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
//         padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
              children: [
                  _buildMenuItem('assets/images/menu/icon_menu_trip.png', '여행', krIndex),
                  SizedBox(width: 5),
                  _buildMenuItem('assets/images/menu/icon_menu_trans.png', '교통', krIndex),
                  SizedBox(width: 5),
                  _buildMenuItem('assets/images/menu/icon_menu_info.png', '생활정보', krIndex),
                  SizedBox(width: 5),
                  _buildMenuItem('assets/images/menu/icon_menu_news.png', '뉴스', krIndex),
                  SizedBox(width: 5),
                  _buildMenuItem('assets/images/menu/icon_menu_shopping.png', '쇼핑', krIndex),
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
      var enIndex = transKrToEn(krIndex);
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
          children: [
            _buildMenuItem('assets/images/menu/icon_menu_trip.png', 'trip', enIndex),
            SizedBox(width: 5),
            _buildMenuItem('assets/images/menu/icon_menu_trans.png', 'trans', enIndex),
            SizedBox(width: 5),
            _buildMenuItem('assets/images/menu/icon_menu_info.png', 'info', enIndex),
            SizedBox(width: 5),
            _buildMenuItem('assets/images/menu/icon_menu_news.png', 'news', enIndex),
            SizedBox(width: 5),
            _buildMenuItem('assets/images/menu/icon_menu_shopping.png', 'shopping', enIndex),
          ],
        ),
      );
    }
  }

  Widget _buildMenuItem(String mIcon, String text, String param) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(0),
        border: Border(
          bottom: BorderSide(
            color: param == text ? Colors.green : Colors.white,
            width: 3.0,
          )
        ),
        // border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (param == text) ...[
          //
          // ] else ...[
          //
          // ],
          Container(
            child:
            InkWell(
              child: Image(
                image: AssetImage(mIcon),
                fit: BoxFit.fitHeight,
              ),
              onTap: () {
               print('test');
              },
            ),
          ),
          // Image(
          //   image: AssetImage(mIcon),
          //   fit: BoxFit.fitHeight,
          // ),
          // // SizedBox(height: 5),
          // Text(
          //   text,
          //   style: TextStyle(color: Colors.black87),
          // ),
        ],
      ),
    );
  }

  transKrToEn(value) {
    var returnValue = 'trip';

    if (value == '여행') {
      returnValue = 'trip';
    } else if (value == '교통') {
      returnValue = 'trans';
    } else if (value == '생활정보') {
      returnValue = 'info';
    } else if (value == '뉴스') {
      returnValue = 'news';
    } else if (value == '쇼핑') {
      returnValue = 'shopping';
    }
    return returnValue;
  }
}

