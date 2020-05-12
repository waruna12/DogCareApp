import 'package:dogApp_Design/config/app_config.dart';
import 'package:dogApp_Design/config/app_theme.dart';
import 'package:dogApp_Design/widgets/app_bar_wdiget.dart';
import 'package:dogApp_Design/widgets/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';

class PlanGeneratePage extends StatefulWidget {
  final String tag;

  const PlanGeneratePage({Key key, this.tag = " no value"}) : super(key: key);
  @override
  _PlanGeneratePageState createState() => _PlanGeneratePageState();
}

class _PlanGeneratePageState extends State<PlanGeneratePage> {
  String _currentBreedSelected = 'Boxer';
  String _currentGenderSelected = 'Male';
  String _activityLevelSelected = 'Normal';
  String _currentDietSelected = 'Wet';
  String _currentTreatsSelected = 'SomeT';
  String _currentNeuteredSelected = 'No';
  String _currentBodyType = 'Skinny';

  String _name;

  String _currentWeight;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name", hoverColor: Colors.green),
      validator: (String value) {
        if (value.isEmpty) {
          return "Name is Required";
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildWeightField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Current Weight"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Weight is Required";
        }
      },
      onSaved: (String value) {
        _currentWeight = value;
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
                _buildNameField(),
                _buildWeightField(),
                SizedBox(height: 20),
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
                    placeholder: "Select Gender:",
                    listItems: ['Male', 'Female'],
                    onChange: (String value) {
                      setState(() {
                        this._currentGenderSelected = value;
                      });
                    }),
                customDropdownFormField(
                    initialValue: _activityLevelSelected,
                    placeholder: "Activity Level  :",
                    listItems: ['Normal', 'Hight'],
                    onChange: (String value) {
                      setState(() {
                        this._activityLevelSelected = value;
                      });
                    }),
                customDropdownFormField(
                    initialValue: _currentDietSelected,
                    placeholder: "Current Diet     :",
                    listItems: ['Wet', 'HomeMade'],
                    onChange: (String value) {
                      setState(() {
                        this._currentDietSelected = value;
                      });
                    }),
                customDropdownFormField(
                    initialValue: _currentTreatsSelected,
                    placeholder: "Current Treats :",
                    listItems: ['SomeT', 'LotsT'],
                    onChange: (String value) {
                      setState(() {
                        this._currentTreatsSelected = value;
                      });
                    }),
                customDropdownFormField(
                    initialValue: _currentNeuteredSelected,
                    placeholder: "Neutered          :",
                    listItems: ['No', 'Yes'],
                    onChange: (String value) {
                      setState(() {
                        this._currentNeuteredSelected = value;
                      });
                    }),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Select Body Type : ',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 300,
                  child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true, // use
                      children: bodytypeList.map((item) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentBodyType = item.name;
                            });
                          },
                          child: Container(
                              color: _currentBodyType == item.name
                                  ? Colors.blue
                                  : Colors.white,
                              child: Card(
                                shadowColor: Colors.black,
                                shape: Border.all(color: Colors.black12),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      item.imageUrl,
                                      height: 80,
                                    ),
                                    Text(item.name),
                                  ],
                                ),
                              )),
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Colors.blueGrey[800],
                  child: Text(
                    "Calculate",
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
                    print(_currentWeight);
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
