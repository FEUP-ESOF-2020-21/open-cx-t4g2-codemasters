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

            //BUTTON SIGNUP
            Container(
              padding: EdgeInsets.symmetric(vertical: 45.0),
              width: 278,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () => print('Login Button Pressed'),
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.orangeAccent,
                child: Text(
                  'SIGNUP',
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

            Container(
              child: FlatButton(
                onPressed: () => print('Login Button pressed'),
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
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
          ])
        ])));
  }
}
