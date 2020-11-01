import 'package:ESOF/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import 'utils/field.dart';
import 'utils/LabelSI.dart';
import 'feed.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = new List();

    //Top Banner
    columnChildren.add(
      Container(
        child: Text(
          "Sign In",
          style: bigText,
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      ),
    );

    //Label Username
    columnChildren
        .add(LabelSI("Username", EdgeInsets.fromLTRB(0, 30, 180, 10)));

    //Username field
    columnChildren.add(Field(
        "Enter your Username",
        Icon(
          Icons.alternate_email,
          color: Colors.black54,
        )));

    //Password label
    columnChildren
        .add(LabelSI("Passowrd", EdgeInsets.fromLTRB(0, 30, 180, 10)));

    //Password Field
    columnChildren.add(Field(
        "Enter your Password",
        Icon(
          Icons.lock,
          color: Colors.black54,
        )));

    columnChildren.add(Container(
      padding: EdgeInsets.symmetric(vertical: 45.0),
      width: 278,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FeedScreen()));
        },
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.orangeAccent,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));

    columnChildren.add(
      Container(
        child: Text(
          "Don't have an account?",
          style: smallerText,
        ),
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
      ),
    );

    columnChildren.add(
      Container(
        child: FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: Text(
            "Sign up",
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
    );

    Column column = new Column(
      children: columnChildren,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    Scaffold scaffold = new Scaffold(
      body: Container(
        child: column,
        width: double.infinity,
      ),
      resizeToAvoidBottomPadding: false,
    );

    return scaffold;
  }
}
