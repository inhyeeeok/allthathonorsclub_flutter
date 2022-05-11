import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:allthathonorsclub_demo1/pages/recipe_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context, String kind) async {
    final getMenuData =
        FirebaseFirestore.instance.collection("allthathonorsclub").doc("menu");
    final data = await getMenuData.get();

    List<Map<String, String>> classData =
        kind == '내국인' ? makeDataSet(data['kr']) : makeDataSet(data['en']);

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => RecipePage(classData, kind)),
    );
  }

  makeDataSet(toBeData) {
    List<Map<String, String>> returnData = [];

    toBeData.forEach((i) {
      returnData.add(Map<String, String>.from(i));
    });

    return returnData;
  }

  Widget _buildFullscreenImage(String assetName) {
    return Image.asset(
      'assets/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildElevatedButton(String assetName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      // height: 40,
      child: ElevatedButton(
        child: Text(
          '$assetName',
          style: TextStyle(
              fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () => _onIntroEnd(context, assetName),
        style: ElevatedButton.styleFrom(
          primary: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const coverBodyStyle = TextStyle(fontSize: 25.0, color: Colors.white);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    const coverDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
      bodyTextStyle: coverBodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      pageColor: Colors.lightGreen,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.lightGreen,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('images/logo/logo_on.png', 100),
          ),
        ),
      ),
      // globalFooter: Container(
      //   child: SizedBox(
      //     width: double.infinity,
      //     height: 60,
      //     child: ElevatedButton(
      //       child: const Text(
      //         'Let\'s go right away!',
      //         style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //       ),
      //       onPressed: () => _onIntroEnd(context),
      //     ),
      //   ),
      // ),

      pages: [
        PageViewModel(
          title: "",
          body: "고품격 맞춤형 온라인\n개인 비서 및 외출 동행 서비스\n\nHIGH-END\nCONCIERGE SERVICE",
          image: _buildImage('images/logo/logo_on.png'),
          decoration: coverDecoration,
        ),
        if (true) ...[
          PageViewModel(
            title: "아너스 컨시어지 서비스\n(온라인)",
            body:
                "멀리 떨어져 살거나 바쁜 업무로 부모님을 자주 찾아 뵙지 못하는 자녀분들의 마음의 불편함과 애로 사항을 해결해드리고자 합니다.",
            image: _buildFullscreenImage('images/sample/1.jpg'),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 3,
            ),
          ),
        ],

        PageViewModel(
          title: "아너스 동행 서비스\n(오프라인)",
          body:
              "고객님의 지인, 가족, 친구분들과 즐기고 싶은 맛집, 미술관, 추억의 장소, 근교 멋진 카페 등 원하시는 그 곳에 아름다운 동행을 함께 하겠습니다.",
          image: _buildFullscreenImage('images/sample/2.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),

        // PageViewModel(
        //   title: "Title of last page - reversed",
        //   bodyWidget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       // Text("Click on ", style: bodyStyle),
        //       // Icon(Icons.edit),
        //       // Text(" to edit a post", style: bodyStyle),
        //       Text("대한민국 최고의 항공사 임직원 및 호텔리어 출신들이\n퍼스트 클래스 수준의 품격이 있는 서비스로"),
        //     ],
        //   ),
        //   decoration: coverDecoration.copyWith(
        //     bodyFlex: 2,
        //     imageFlex: 4,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //   image: _buildImage('images/sample/102.jpg'),
        //   reverse: true,
        // ),
        PageViewModel(
          title: "(주)올댓아너스클럽",
          body:
              "서울시 강서구 마곡중앙6로 11 보타닉파크타워3 719호 \n 대표전화 : 1600-0595 / 업무시간 : 주중 09:30~17:30",
          // bodyWidget: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //           "서울시 강서구 마곡중앙6로 11 보타닉파크타워3 719호 \n 대표전화 : 1600-0595 / 업무시간 : 주중 09:30~17:30"
          //           , style: TextStyle(fontSize: 25.0, color: Colors.white)
          //       ),
          //       _buildElevatedButton('내국인'),
          //       _buildElevatedButton('Foreigner'),
          //     ],
          //   ),
          image: _buildImage('images/sample/4.jpg'),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildElevatedButton('내국인'),
              SizedBox(width: 30),
              _buildElevatedButton('Foreigner'),
            ],
          ),
          decoration: coverDecoration,
        ),
      ],

      onDone: () => _onIntroEnd(context, '내국인'),
      // onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      // done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      done: Text(''),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
