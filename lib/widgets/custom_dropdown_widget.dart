import 'package:flutter/material.dart';

Widget customDropdownFormField(
    {String placeholder = "",
    List<String> listItems,
    String initialValue,
    Function(String) onChange}) {
  return Row(
    children: <Widget>[
      Container(padding: EdgeInsets.only(right: 10), child: Text(placeholder)),
      Expanded(
        child: DropdownButton<String>(
          isExpanded: true,
          items: listItems.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String _value) {
            onChange(_value);
          },
          value: initialValue,
        ),
      ),
    ],
  );
}
