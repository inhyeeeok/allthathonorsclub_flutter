import 'package:allthathonorsclub_demo1/pages/boarding_page.dart';
import 'package:allthathonorsclub_demo1/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //firebase initializing
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'allthathonors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "PatuaOne"),
      // home: OnBoardingPage(),
      home: MainPage(),
    );
  }
}