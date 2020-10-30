import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../style.dart';
import "./utils/label.dart";
import './utils/field.dart';
import '../ui_elements.dart';

class SignupScreen extends StatelessWidget {
  Icon _name = Icon(Icons.person, color: Colors.black54);
  Icon _username = Icon(Icons.people, color: Colors.black54);
  Icon _email = Icon(Icons.alternate_email, color: Colors.black54);
  Icon _key = Icon(Icons.vpn_key, color: Colors.black54);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: navigationBar,
        body: Container(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Column(children: [
            // TITLE
            Container(
              child: Text(
                "SignUp",
                style: bigText,
              ),
              margin: EdgeInsets.fromLTRB(0, 80, 0, 50),
            ),

            // FIELDS FROM FORM
            new Label("Name:    "),
            new Field("name", _name),

            new Label(" Username:"),
            new Field("username", _username),

            new Label("Email:    "),
            new Field("email", _email),

            new Label("Password:"),
            new Field("password", _key),

            new Label("Confirm password:"),
            new Field("confirm password", _key)
          ])
        ])));
  }
}
