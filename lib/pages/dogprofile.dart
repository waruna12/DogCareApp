import 'package:dogApp_Design/config/app_theme.dart';
import 'package:dogApp_Design/models/dog_profile.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:flutter/material.dart';

import 'dogaddmedical.dart';

class DogProfilePage extends StatefulWidget {
  @override
  _DogProfilePageState createState() => _DogProfilePageState();
}

class _DogProfilePageState extends State<DogProfilePage> {
  var profile = new DogProfile();
  @override
  void initState() {
    profile.name = "Rex";
    profile.breed = "German Shepard";
    profile.gender = "Male";
    profile.dob = DateTime(2018, 02, 10);

    profile.extraDetails = "-";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[600],
      appBar: MyAppbar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset("assets/images/wallpaper.jpg"),
                Positioned(
                  bottom: -50.0,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/dogfac.png'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            ListTile(
              title: Center(
                child: Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppThemeFonts.SourceSansPro,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About ' + profile.name,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: AppThemeFonts.SourceSansPro,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Card(
                color: Colors.grey[850],
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Name : ' + profile.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: AppThemeFonts.SourceSansPro,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Breed : ' + profile.breed,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: AppThemeFonts.SourceSansPro,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                      Text(
                        'Gender :' + profile.gender,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: AppThemeFonts.SourceSansPro,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                  leading: Icon(
                    Icons.add_box,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Add Medical",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddMedicalPage()),
                    );
                  }),
            ),
            Card(
              color: Colors.grey[850],
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
                title: Text(
                  "Medical Report",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
