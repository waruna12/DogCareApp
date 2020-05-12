import 'package:dogApp_Design/config/app_theme.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final bool withBackButton;
  final AppBar appBar;
  final List<Widget> widgets;
  const MyAppbar(
      {Key key,
      this.title,
      this.appBar,
      this.widgets,
      this.withBackButton = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: <Widget>[
          // withBackButton
          //     ? IconButton(
          //         icon: Icon(Icons.arrow_back, size: 20),
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //         },
          //       )
          //     : Container(),
          Container(
            padding: EdgeInsets.all(14),
            child: Container(
              child: Image.asset(
                "assets/images/dogpaw.png",
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[900],
      title: Text(
        'DogCare',
        style: TextStyle(fontFamily: AppThemeFonts.Pacifico, fontSize: 23),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.all(10),
          child: Icon(Icons.list),
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
