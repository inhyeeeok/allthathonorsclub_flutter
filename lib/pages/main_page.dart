import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:allthathonorsclub_demo1/pages/recipe_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart'; // 패키지

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // DocumentSnapshot data = _onIntroEnd();
  //
  // Future<DocumentSnapshot> _onIntroEnd() async {
  //   CollectionReference getMenuData = FirebaseFirestore.instance.collection("allthathonorsclub");
  //   DocumentSnapshot data1 = await getMenuData.doc("menu").get();
  //   return data1;
  // }

  makeDataSet(toBeData) {
    List<Map<String, String>> returnData = [];


    Map<String, dynamic> returnData1 = Map<String, dynamic>.from(toBeData);
    // print(returnData1);
    // print(toBeData);
    // toBeData["여행"].forEach((i) {
    //   returnData.add(Map<String, String>.from(i));
    // });
    // print(List<Map<String, List<Map<String, String>>>>.from(toBeData));

    // for(var i=0; i <returnData1.length; i++) {
    //   print(i);
    //   print(returnData1[i]);
    // }

    // print(returnData);
    return returnData1;
  }

  Widget makeButton(String assetName) {
    return TextButton(
        child: Text(assetName),
        onPressed: () async{

          final getMenuData =
          FirebaseFirestore.instance.collection("allthathonorsclub").doc("menu");
          final data = await getMenuData.get();

          Map<String, dynamic> classData = assetName == '내국인'
              ? makeDataSet(data['kr'])
              : makeDataSet(data['en']);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipePage(classData, assetName)),
          );
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(117, 148, 95, 1.0)),
            minimumSize: MaterialStateProperty.all(Size(150, 40))
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(117, 148, 95, 1.0), //버튼 배경색
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
              child: const Center(
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Image(
                image: AssetImage('assets/images/logo/main_logo_white.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: const Center(
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: const Center(
                child: Text(
                  'Welcome to                      \nAll that Honors Club',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7,
              child: const Center(
                child: Text(
                  '아너스클럽에서는 액티브시니어분들과 \n외국인관광객들을 위해 당사에서 특별 제작한 \n맞춤형 이지라이프 앱을 제공해 드림으로써 \n생활의 편리함을 더해드리고자 합니다.',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                // child: Text.rich(
                //   TextSpan(
                //     text: '',
                //       children: <TextSpan>[
                //         TextSpan(text :'아너스클럽에서는 액티브시니어분들과 \n외국인관광객들을 위해 당사에서 특별 제작한 \n맞춤형 이지라이프 앱을 제공해 드림으로써 \n생활의 편리함을 더해드리고자 합니다.',
                //           style: TextStyle(
                //             // fontWeight: FontWeight.bold,
                //             fontSize: 17,
                //             color: Colors.white,
                //           )
                //         ),
                //
                //         TextSpan(text :'\n\nAll that honors club 홈페이지 바로가기 ->',
                //             style: TextStyle(
                //               // fontWeight: FontWeight.bold,
                //               fontSize: 17,
                //               color: Colors.white,
                //               backgroundColor: Colors.black,
                //             )
                //         )
                //       ]
                //   )
                // ),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: (){launchURL('http://allthathonorsclub.com');},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color.fromRGBO(126, 167, 110, 1.0)),
                      ),
                      child: const Text("All that honors club 홈페이지 바로가기 ⇀",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 9,
              child: const Center(
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makeButton('내국인'),
                SizedBox(width: 10, height: 95),
                makeButton('Foreigner')
              ],
            )
          ],
        ),
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
