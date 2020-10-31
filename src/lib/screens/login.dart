import 'package:ESOF/auth/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import 'utils/field.dart';
import 'utils/LabelSI.dart';
import 'feed.dart';
import '../model/user.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Sign In",
              style: bigText,
            ),
            margin: EdgeInsets.fromLTRB(0, 50, 0, 30),
          ),
          MyTextFormField(
            hintText: 'Username',
            onSaved: (String value) {
              user.email = value;
            },
          ),
          MyTextFormField(
            hintText: 'Password',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'Password should be minimum 7 characters';
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              user.password = value;
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 45.0),
            width: 278,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(user.email);
                  AuthService.signUp(user.email, user.password);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedScreen()));
                }
              },
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
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
          ),
          Container(
            child: Text(
              "Don't have an account?",
              style: smallerText,
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedScreen()));
              }, //Mudar para Sign in
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
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          ),
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(
            color: accentOrange,
          ),
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

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
        .add(LabelSI("Passoword", EdgeInsets.fromLTRB(0, 30, 180, 10)));

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedScreen()));
          }, //Mudar para Sign in
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
