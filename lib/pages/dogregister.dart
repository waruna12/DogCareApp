import 'package:dogApp_Design/config/app_theme.dart';
import 'package:dogApp_Design/util/app_utils.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:dogApp_Design/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String tag;

  const RegisterPage({Key key, this.tag = " no value"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _currentBreedSelected = 'Boxer';
  var _currentGenderSelected = 'Male';

  String _name;

  String _breedAddr;
  String _ownerAddr;
  String _veterinarySurgeon;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Dog Name"),
      validator: (String value) {
        return AppUtils.simpleTextFieldValidator(value,
            name: "Name", min: 4, max: 10);
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildBreedAddrField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Breeder/Address"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Required";
        }
      },
      onSaved: (String value) {
        _breedAddr = value;
      },
    );
  }

  Widget _buildOwnerAddrField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Owner/Address"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Required";
        }
      },
      onSaved: (String value) {
        _ownerAddr = value;
      },
    );
  }

  Widget _buildVeterinarySurgeonField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Veterinary Surgeon"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Veterinary Surgeon Required";
        }
      },
      onSaved: (String value) {
        _veterinarySurgeon = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[400],
      appBar: MyAppbar(
        appBar: AppBar(),
        // withBackButton: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNameField(),
                customDropdownFormField(
                    initialValue: _currentBreedSelected,
                    placeholder: "Select Breed  :",
                    listItems: ['Labridor', 'Dogman', 'Boxer'],
                    onChange: (String value) {
                      setState(() {
                        this._currentBreedSelected = value;
                      });
                    }),
                customDropdownFormField(
                    initialValue: _currentGenderSelected,
                    placeholder: "Sex                  :  ",
                    listItems: ['Male', 'Female'],
                    onChange: (String value) {
                      setState(() {
                        this._currentGenderSelected = value;
                      });
                    }),
                _buildBreedAddrField(),
                _buildOwnerAddrField(),
                _buildVeterinarySurgeonField(),
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

                    print(_name);

                    print(_breedAddr);
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
