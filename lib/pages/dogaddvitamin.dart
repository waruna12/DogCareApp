import 'package:dogApp_Design/config/app_theme.dart';
import 'package:dogApp_Design/util/app_utils.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:dogApp_Design/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddVitaminPage extends StatefulWidget {
  final String tag;

  const AddVitaminPage({Key key, this.tag = " no value"}) : super(key: key);

  @override
  _AddVitaminPageState createState() => _AddVitaminPageState();
}

class _AddVitaminPageState extends State<AddVitaminPage> {
  String _surgeonId;

  var _currentVitaminSelected = 'A';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Veterinary Surgeon Id"),
      validator: (String value) {
        return AppUtils.simpleTextFieldValidator(value,
            name: "Name", min: 4, max: 10);
      },
      onSaved: (String value) {
        _surgeonId = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customDropdownFormField(
                    initialValue: _currentVitaminSelected,
                    placeholder: "Type Of Vitamin :",
                    listItems: ['A', 'B', 'C'],
                    onChange: (String value) {
                      setState(() {
                        this._currentVitaminSelected = value;
                      });
                    }),
                _buildNameField(),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.blueGrey[800],
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: AppThemeFonts.SourceSansPro,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    if (!_formkey.currentState.validate()) {
                      return;
                    }

                    _formkey.currentState.save();

                    print(_surgeonId);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
