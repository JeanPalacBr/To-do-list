import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String sel1 = "DEFAULT";
class TypeTodoDDbutton extends StatelessWidget{
  const TypeTodoDDbutton({
    this.valchan,
  });
  final ValueChanged<String> valchan;
Widget build(BuildContext context) {
  return DropdownButton<String>(
    value: sel1,
    icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.deepPurple
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      valchan(newValue);
      sel1 = newValue;
      
    },
    items: <String>["DEFAULT", "CALL", "HOME_WORK"]
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}



}