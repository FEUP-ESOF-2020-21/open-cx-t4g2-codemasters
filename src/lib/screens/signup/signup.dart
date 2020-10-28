import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';
import "label.dart";
import 'field.dart';
import '../../ui_elements.dart';

class SignupScreen extends StatelessWidget {
  Icon _name = Icon (Icons.face, color: Colors.black54);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: navigationBar,

        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TITLE
                Container(
                  child: Text(
                    "SignUp",
                    style: bigText,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                ),

                // FIELDS FROM FORM
                new Label("name"),
                new Field("name", _name)
              ],
            )));
  }
}
