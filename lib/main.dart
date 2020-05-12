import 'package:dogApp_Design/config/app_theme.dart';
import 'package:dogApp_Design/pages/dogprofile.dart';
import 'package:dogApp_Design/pages/dogregister.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:flutter/material.dart';

import 'pages/dogschedule.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: DogApp()),
  );
}

class DogApp extends StatefulWidget {
  @override
  _DogAppState createState() => _DogAppState();
}

class _DogAppState extends State<DogApp> {
  Widget cardWidged(String text, String assetIamgePath, double imagemargin,
      {Color bgColor = Colors.red, Function onTap}) {
    return Expanded(
      child: Container(
        height: 150,
        child: Card(
          color: bgColor,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print(DateTime.now());
              if (onTap != null) {
                onTap();
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Image.asset(assetIamgePath),
                  ),
                  Container(
                    margin: EdgeInsets.all(imagemargin),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: AppThemeFonts.SourceSansPro,
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                cardWidged("Register", "assets/images/dogregister.png", 14,
                    bgColor: Colors.blueGrey[600], onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPage(tag: "test tag")),
                  );
                }),
                cardWidged("Profile", "assets/images/dogsit.png", 5,
                    bgColor: Colors.blueGrey[600], onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DogProfilePage(),
                    ),
                  );
                }),
              ],
            ),
            Row(
              children: [
                cardWidged("Schedule", "assets/images/foodcup.png", 5,
                    bgColor: Colors.blueGrey[600], onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePage(),
                    ),
                  );
                }),
                cardWidged("text2 1", "assets/images/dogpaw.png", 5,
                    bgColor: Colors.blueGrey[600]),
              ],
            ),
            Row(
              children: [
                cardWidged("text 1", "assets/images/dogpaw.png", 5,
                    bgColor: Colors.blueGrey[600]),
                cardWidged("text2 1", "assets/images/dogpaw.png", 5,
                    bgColor: Colors.blueGrey[600]),
              ],
            ),
            Row(
              children: [
                cardWidged("text 1", "assets/images/dogpaw.png", 5,
                    bgColor: Colors.blueGrey[600]),
                cardWidged("text2 1", "assets/images/dogpaw.png", 5,
                    bgColor: Colors.blueGrey[600]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
