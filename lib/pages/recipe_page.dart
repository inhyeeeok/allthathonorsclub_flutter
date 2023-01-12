import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/components/recipe_page_item.dart';

import '../components/recipe_gridview_item.dart';
import '../components/recipe_menu.dart';
import '../components/recipe_tabbar.dart';

class RecipePage extends StatefulWidget {
  final classData1;
  final lang1;
  final menuIndex1;

  RecipePage(this.classData1, this.lang1, this.menuIndex1);

  @override
  _TabPage createState() => _TabPage(classData1, lang1, menuIndex1);
}

class _TabPage extends State<RecipePage> with TickerProviderStateMixin {
  final classData;
  final lang;
  final menuIndex;

  _TabPage(this.classData, this.lang, this.menuIndex);

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: const Color.fromRGBO(235, 241, 243, 1.0),
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(lang),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _buildTabBar()
          ),

          Expanded(
            child: _buildTabBarView()
          ),
        ],
      ),

    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: new Column(children: <Widget>[
              RecipeMenu('여행'),
              _buildTabBarName('여행'),
            ])),
        Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: new Column(children: <Widget>[
              RecipeMenu('교통'),
              _buildTabBarName('교통'),
            ])),
        Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: new Column(children: <Widget>[
              RecipeMenu('생활정보'),
              _buildTabBarName('생활정보'),
            ])),
        Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: new Column(children: <Widget>[
              RecipeMenu('뉴스'),
              _buildTabBarName('뉴스'),
            ])),
        Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: new Column(children: <Widget>[
              RecipeMenu('쇼핑'),
              _buildTabBarName('쇼핑'),
            ])),
      ],

      // indicator: BoxDecoration(
      //     color: Colors.greenAccent,
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/menu/icon_menu_trip.png'),
      //         fit: BoxFit.fitWidth)
      // ),

      // labelColor: Colors.black,
      // isScrollable: true,
      // unselectedLabelColor: Colors.black,
      indicatorWeight: 4,
      indicatorColor: const Color.fromRGBO(117, 148, 95, 1.0),


      controller: _tabController,
    );
  }

  _buildTransKrToEn(String tabName) {
    var returnValue = 'trip';

    if (tabName == '여행') {
      returnValue = 'trip';
    } else if (tabName == '교통') {
      returnValue = 'trans';
    } else if (tabName == '생활정보') {
      returnValue = 'info';
    } else if (tabName == '뉴스') {
      returnValue = 'news';
    } else if (tabName == '쇼핑') {
      returnValue = 'shopping';
    }
    return returnValue;
  }

  Widget _buildTabBarName(String tabName) {
    String returnName = tabName;
    double reSizefont = 11;

    if (lang == 'Foreigner') {
      returnName = _buildTransKrToEn(tabName);
      reSizefont = 9;
    }

    return Text(
      returnName,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: reSizefont),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: const Color.fromRGBO(235, 241, 243, 1.0),
          child: RecipePageItem(classData, lang, '여행'),
        ),
        Container(
          color: const Color.fromRGBO(235, 241, 243, 1.0),
          child: RecipePageItem(classData, lang, '교통'),
        ),
        Container(
          color: const Color.fromRGBO(235, 241, 243, 1.0),
          child: RecipePageItem(classData, lang, '생활정보'),
        ),
        Container(
          color: const Color.fromRGBO(235, 241, 243, 1.0),
          child: RecipePageItem(classData, lang, '뉴스'),
        ),
        Container(
          color: const Color.fromRGBO(235, 241, 243, 1.0),
          child: RecipePageItem(classData, lang, '쇼핑'),
        ),
      ],
    );
  }

  AppBar _buildRecipeAppBar(String lang) {
    var title = (lang == '내국인') ? '올댓 아너스 클럽' : 'All that Honors Club';

    return AppBar(
      backgroundColor: const Color.fromRGBO(117, 148, 95, 1.0),
      title: Container(
        // margin: EdgeInsets.only(left: 45.0),
        margin: EdgeInsets.only(left: 0.0),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white70),
    );
  }
}
