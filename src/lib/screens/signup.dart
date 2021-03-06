import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/auth/userSetup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../style.dart";
import 'utils/field.dart';
import "utils/label.dart";
import '../auth/userSetup.dart';
import '../model/userModel.dart';
import 'login.dart';
import '../auth/validation.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  Icon _username = Icon(Icons.people, color: Colors.black54);
  Icon _email = Icon(Icons.alternate_email, color: Colors.black54);
  Icon _key = Icon(Icons.lock, color: Colors.black54);

  bool signUpFailed = false;
  String signUpFailedMsg;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
      SizedBox(
        height: 50.0,
      ),
      Form(
          key: _formKey,
          child: Column(children: [
            // TITLE
            Container(
              child: Text(
                "Sign Up",
                style: bigText,
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
            ),

            // FIELDS FROM FORM
            Label("Username:"),
            Field(
                hintTxt: "Username",
                icon: _username,
                validator: (String value) {
                  if (value.isEmpty) return '    Please enter your Username';
                  _formKey.currentState.save();
                  return null;
                },
                onSaved: (String value) {
                  user.username = value;
                }),

            Label("Email:"),
            Field(
              hintTxt: "Email",
              icon: _email,
              validator: (String value) {
                if (value.isEmpty) return '    Please enter your Email';
                String msg = validateEmail(value);
                if (msg != null) return '    ' + msg;
                _formKey.currentState.save();
              },
              onSaved: (String value) {
                user.email = value;
              },
            ),

            Label("Password:"),
            Field(
                hintTxt: "Password",
                isPassword: true,
                icon: _key,
                validator: (String value) {
                  if (value.isEmpty) return '    Please enter your Password';
                  if (value.length < 7)
                    return '    Password should be minimum 7 characters';

                  _formKey.currentState.save();
                },
                onSaved: (String value) {
                  user.password = value;
                }),
            signUpFailed
                ? Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 70.0, vertical: 10),
                    child: Text(
                      'SignUp Failed! - ' + signUpFailedMsg,
                      style: errorMessageText,
                    ),
                  )
                : Text(''),

            //Label("Confirm password:"),
            //Field("confirm password", _key),

            //BUTTON SIGN UP
            Container(
              padding: EdgeInsets.symmetric(vertical: 45.0),
              width: 278,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    String result =
                        await AuthService.signUp(user.email, user.password);
                    if (result == null) {
                      userSetup(user);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else {
                      setState(() {
                        signUpFailed = true;
                        signUpFailedMsg = result;
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
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
          ]))
    ])));
  }
}
