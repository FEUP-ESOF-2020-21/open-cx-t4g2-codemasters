import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import "../ui_elements.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = new List();
    columnChildren.add(
      Container(
        child: Text(
          "Login",
          style: bigText,
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
      ),
    );

    columnChildren.add(
      Container(
        child: Text(
          "Username:",
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(0, 20, 150, 20),
      ),
    );
    columnChildren.add(
      Container(
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
        ),
        color: accentGrey,
        //decoration: Decoration(),
        width: 238,
        height: 40,
      ),
    );
    columnChildren.add(Container(
        child: Text(
          "Password:",
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(0, 20, 150, 20)));
    columnChildren.add(
      Container(
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
        ),
        color: accentGrey,
        width: 238,
        height: 40,
      ),
    );
    columnChildren.add(
      Container(
        child: Text(
          "Don't have an account?",
          style: smallerText,
        ),
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      ),
    );

    columnChildren.add(
      Container(
        child: Text(
          "Sign up",
          style: TextStyle(color: accentOrange, fontSize: 15),
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
      appBar: appBar,
      bottomNavigationBar: navigationBar,
    );

    return scaffold;
  }
}
