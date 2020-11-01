import 'package:ESOF/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../style.dart';
import "./utils/label.dart";
import './utils/field.dart';
import 'feed.dart';

class SignupScreen extends StatelessWidget {
  final Icon _name = Icon(Icons.person, color: Colors.black54);
  final Icon _username = Icon(Icons.people, color: Colors.black54);
  final Icon _email = Icon(Icons.alternate_email, color: Colors.black54);
  final Icon _key = Icon(Icons.vpn_key, color: Colors.black54);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Column(children: [
        // TITLE
        Container(
          child: Text(
            "Sign Up",
            style: bigText,
          ),
          margin: EdgeInsets.fromLTRB(0, 80, 0, 50),
        ),

        // FIELDS FROM FORM
        new Label("Name:"),
        new Field("name", _name),

        new Label("Username:"),
        new Field("username", _username),

        new Label("Email:"),
        new Field("email", _email),

        new Label("Password:"),
        new Field("password", _key),

        new Label("Confirm password:"),
        new Field("confirm password", _key),

        //BUTTON SIGN UP
        Container(
          padding: EdgeInsets.symmetric(vertical: 45.0),
          width: 278,
          child: RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedScreen()));
            },
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.orangeAccent,
            child: Text(
              'SIGN UP',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          child: Text(
            "Already have an account?",
            style: smallerText,
          ),
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        ),

        //BACK TO LOGIN BUTTON
        Container(
          child: FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: accentOrange,
                fontSize: 25,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
                shadows: [
                  BoxShadow(
                    color: Colors.orangeAccent,
                    blurRadius: 4.0,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
        ),
      ])
    ])));
  }
}
