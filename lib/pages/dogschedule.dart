import 'package:dogApp_Design/pages/dogplangenerate.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBar: AppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset('assets/images/doggroup.png'),
          Card(
            color: Colors.red,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.touch_app,
                  color: Colors.white,
                ),
                title: Text(
                  "Generate Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanGeneratePage()),
                  );
                }),
          ),
          Card(
            color: Colors.blueGrey[900],
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.laptop,
                  color: Colors.white,
                ),
                title: Text(
                  "Display Plans",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanGeneratePage()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
