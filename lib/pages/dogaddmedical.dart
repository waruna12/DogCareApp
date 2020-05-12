import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:flutter/material.dart';

import 'dogaddothermedical.dart';
import 'dogaddvaccination.dart';
import 'dogaddvitamin.dart';

class AddMedicalPage extends StatefulWidget {
  @override
  _AddMedicalPageState createState() => _AddMedicalPageState();
}

class _AddMedicalPageState extends State<AddMedicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBar: AppBar(),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.blueGrey[800],
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: Text(
                  "Add Vaccination",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddVaccinationPage()),
                  );
                }),
          ),
          Card(
            color: Colors.blueGrey[800],
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: Text(
                  "Add Vatamin",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddVitaminPage()),
                  );
                }),
          ),
          Card(
            color: Colors.blueGrey[800],
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: Text(
                  "Add Others",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddOtherMedicalPage()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
