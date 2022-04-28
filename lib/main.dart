import 'package:allthathonorsclub_demo1/pages/boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/pages/recipe_page.dart';
import 'package:allthathonorsclub_demo1/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "PatuaOne"),
      home: OnBoardingPage(),
    );
  }
}