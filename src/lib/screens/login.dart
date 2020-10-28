import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = new List();
    columnChildren.add(
      Container(
        child: Text(
          "Sign In",
          style: bigText,
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      ),
    );

    columnChildren.add(
      Container(
        child: Text(
          "Username:",
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(0, 20, 180, 10),
      ),
    );
    columnChildren.add(Container(
      alignment: Alignment.centerLeft,
      decoration: inputBoxDecoration,
      height: 60.0,
      width: 278,
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.alternate_email,
            color: Colors.black54,
          ),
          hintText: 'Enter your Username',
          hintStyle: hintText,
        ),
      ),
    ));

    columnChildren.add(Container(
        child: Text(
          "Password:",
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(0, 30, 180, 10)));
    columnChildren.add(Container(
      alignment: Alignment.centerLeft,
      decoration: inputBoxDecoration,
      height: 60.0,
      width: 278,
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black54,
          ),
          hintText: 'Enter your Password',
          hintStyle: hintText,
        ),
      ),
    ));

    columnChildren.add(Container(
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
