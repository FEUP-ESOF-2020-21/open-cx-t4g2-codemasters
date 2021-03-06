import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import 'utils/field.dart';
import 'utils/LabelSI.dart';
import '../ui_elements.dart';
import '../model/userModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  bool loginFailed = false;
  String loginFailedMsg;

  @override
  Widget build(BuildContext context) {
    Icon _key = Icon(Icons.lock, color: Colors.black54);
    Icon _email = Icon(Icons.alternate_email, color: Colors.black54);

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

    //Label Email
    columnChildren.add(LabelSI("Email", EdgeInsets.fromLTRB(0, 30, 220, 10)));

    //Username field
    columnChildren.add(Field(
      hintTxt: 'Email',
      icon: _email,
      validator: (String value) {
        if (value.isEmpty) return '    Please enter your Email';
        _formKey.currentState.save();
      },
      onSaved: (String value) {
        user.email = value;
      },
    ));

    //Password label
    columnChildren
        .add(LabelSI("Password", EdgeInsets.fromLTRB(0, 30, 180, 10)));

    //Password Field
    columnChildren.add(Field(
      hintTxt: 'Password',
      isPassword: true,
      icon: _key,
      validator: (String value) {
        if (value.isEmpty) return '    Please enter your Password';
        if (value.length < 7)
          return '    Password should be minimum 7 characters';

        _formKey.currentState.save();
        return null;
      },
      onSaved: (String value) {
        user.password = value;
      },
    ));

    if (loginFailed) {
      columnChildren.add(Container(
        margin: new EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
        child: Text(
          'Login Failed! - ' + loginFailedMsg,
          style: errorMessageText,
        ),
      ));
    }

    columnChildren.add(
      Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: 278,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              // print(user.email);

              String result =
                  await AuthService.signIn(user.email, user.password);
              // print(AuthService.auth.currentUser.uid);
              if (result == null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              } else {
                setState(() {
                  loginFailed = true;
                  loginFailedMsg = result;
                });
              }
            }
          },
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.orangeAccent,
          child: Text(
            'LOGIN',
            style: submitTextWhite,
            key: Key('submitBtn'),
          ),
        ),
      ),
    );

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

    Form form = new Form(
        key: _formKey,
        child: Column(
          children: columnChildren,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ));

    Scaffold scaffold = new Scaffold(
      body: Container(
        child: form,
        width: double.infinity,
      ),
      resizeToAvoidBottomPadding: false,
    );

    return scaffold;
  }
}
