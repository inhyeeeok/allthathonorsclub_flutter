import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  final index;

  RecipeMenu(this.index);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        children: [
          if (index == '여행' || index == 'trip') ...[
            _buildMenuItem('assets/images/menu/icon_menu_trip.png'),
          ] else if (index == '교통' || index == 'trans') ...[
            _buildMenuItem('assets/images/menu/icon_menu_trans.png'),
          ] else if (index == '생활정보' || index == 'info') ...[
            _buildMenuItem('assets/images/menu/icon_menu_info.png'),
          ] else if (index == '뉴스' || index == 'news') ...[
            _buildMenuItem('assets/images/menu/icon_menu_news.png'),
          ] else if (index == '쇼핑' || index == 'shopping') ...[
            _buildMenuItem('assets/images/menu/icon_menu_shopping.png'),

          ] else
            _buildMenuItem('assets/images/menu/icon_menu_shopping.png'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String mIcon) {
    return Container(
      // color: Colors.greenAccent,
      height: 50,
      child: Image(
        image: AssetImage(mIcon),

        fit: BoxFit.fill,
      ),
    );
  }
}

