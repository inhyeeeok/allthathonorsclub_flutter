import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/pages/recipe_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Map<String, String>> menuMapKR = [
    {"item": "올댓아너스클럽", "kinds": "기타", "url": "https://www.naver.com", "img": "", "description":"올댓아너스클럽"},
    {"item": "싸이버스카이", "kinds": "항공", "url": "https://www.naver.com", "img": "sample/2.jpg", "description":"㈜싸이버스카이는 새로운 여행 쇼핑문화의 제공을 목적으로 지난 2000년 6월에 설립된 한진그룹의 대표 이커머스 기업입니다."},
    {"item": "대한민국 구석구석", "kinds": "여행", "url": "https://www.naver.com", "img": "sample/1.jpg", "description":"대한민국 구석구석"},
    {"item": "도시 고속도로", "kinds": "지도", "url": "https://www.naver.com", "img": "sample/11.jpg", "description":""},
    {"item": "대한항공", "kinds": "항공", "url": "https://www.koreanair.com/kr/ko", "img": "sample/5.jpg", "description":"대한항공은 대한민국의 국적 항공사이며, 항공 동맹체인 스카이팀의 창립 항공사로 인천국제공항과 김포국제공항을 허브 공항으로 두고 있다."},
    {"item": "토파스여행정보", "kinds": "여행", "url": "", "img": "sample/4.jpg", "description":"토파스 여행정보"},
    {"item": "파파택시", "kinds": "편의", "url": "", "img": "sample/8.jpg", "description":""},
    {"item": "고속도로교통정보", "kinds": "편의", "url": "", "img": "sample/9.jpg", "description":""},
    {"item": "진에어", "kinds": "항공", "url": "https://www.naver.com", "img": "sample/3.jpg", "description":"진에어"},
    {"item": "트립코디", "kinds": "여행", "url": "", "img": "sample/5.jpg", "description":""},
    {"item": "서울 지하철 노선도", "kinds": "지도", "url": "", "img": "sample/11.jpg", "description":""},
    {"item": "계산기", "kinds": "편의", "url": "", "img": "sample/10.jpg", "description":""},
    {"item": "한진관광", "kinds": "여행", "url": "", "img": "sample/6.jpg", "description":""},
    {"item": "한국관광공사", "kinds": "여행", "url": "", "img": "sample/7.jpg", "description":""},
    {"item": "서울버스", "kinds": "지도", "url": "", "img": "sample/11.jpg", "description":""},
    {"item": "파파고", "kinds": "통역", "url": "", "img": "", "description":""},
    {"item": "티맵", "kinds": "지도", "url": "", "img": "sample/11.jpg", "description":""},
    {"item": "말랑말랑 지니톡", "kinds": "통역", "url": "", "img": "", "description":""},
  ];

  final List<Map<String, String>> menuMapEN = [
    {"item": "AllThatHonorsClub", "kinds": "기타", "url": "", "img": "", "description":"1"},
    {"item": "CyberSky", "kinds": "항공", "url": "", "img": "sample/2.jpg", "description":"CyberSky Service CyberSky Service CyberSky Service CyberSky Service CyberSky Service CyberSky Service"},
    {"item": "Korean visitkorea", "kinds": "여행", "url": "", "img": "sample/1.jpg", "description":"Korean visitkorea Korean visitkorea Korean visitkoreaKorean visitkorea"},
    {"item": "도시 고속도로", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "KoreaAir", "kinds": "항공", "url": "", "img": "sample/5.jpg", "description":"KoreaAir Service KoreaAir Service KoreaAir Service KoreaAir Service KoreaAir Service KoreaAir Service"},
    {"item": "Topas", "kinds": "여행", "url": "", "img": "sample/4.jpg", "description":"Topas Topas Topas Topas Topas Topas Topas Topas"},
    {"item": "파파택시", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "고속도로교통정보", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "JinAir", "kinds": "항공", "url": "", "img": "sample/3.jpg", "description":"JinAir Service JinAir Service JinAir Service JinAir Service JinAir Service JinAir Service JinAir Service"},
    {"item": "TripCody", "kinds": "여행", "url": "", "img": "sample/5.jpg", "description":"TripCody TripCody TripCody TripCody TripCody TripCody"},
    {"item": "서울 지하철 노선도", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "계산기", "kinds": "편의", "url": "", "img": "", "description":""},
    {"item": "한진관광", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "한국관광공사", "kinds": "여행", "url": "", "img": "", "description":""},
    {"item": "서울버스", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "파파고", "kinds": "통역", "url": "", "img": "", "description":""},
    {"item": "티맵", "kinds": "지도", "url": "", "img": "", "description":""},
    {"item": "말랑말랑 지니톡", "kinds": "통역", "url": "", "img": "", "description":""},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,

            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Image(
                image: AssetImage('assets/images/logo/logo_on.png'),
                // fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: const Center(
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: const Center(
                child: Text(
                  '고품격 맞춤형 온라인 개인 비서 및 외출 동행 서비스 \n HIGH-END CONCIERGE SERVICE',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeButton('내국인', menuMapKR),
                SizedBox(width : 50),
                makeButton('외국인', menuMapEN)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget makeButton(String title, List<Map<String, String>> param) {
    return TextButton(

      child: Text(title),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipePage(param, title)),
        );
      },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        )
    );
  }
}
