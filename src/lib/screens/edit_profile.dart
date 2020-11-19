import 'package:flutter/material.dart';

import '../auth/validation.dart';
import '../style.dart';
import '../style.dart';
import 'utils/field.dart';
import 'utils/label.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  Icon _username = Icon(Icons.people, color: Colors.black54);
  Icon _email = Icon(Icons.alternate_email, color: Colors.black54);
  Icon _bio = Icon(Icons.description, color: Colors.black54);
  Icon _key = Icon(Icons.lock, color: Colors.black54);
  Icon _image = Icon(Icons.image, color: Colors.black54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 85.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit Profile',
                    style: bigText,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Label("New Photo:"),
                  SizedBox(height: 20),
                  _image,
                  SizedBox(height: 20),
                  Label("New Name:"),
                  Field(
                    hintTxt: "New Name",
                    icon: _username,
                    validator: (String value) {
                      if (value.isEmpty)
                        return '    Please enter your new Name';
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      //user.name = value;
                    },
                  ),
                  Label("New Email:"),
                  Field(
                    hintTxt: "New Email",
                    icon: _email,
                    validator: (String value) {
                      if (value.isEmpty)
                        return '    Please enter your new Email';
                      String msg = validateEmail(value);
                      if (msg != null) return '    ' + msg;
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      //user.email = value;
                    },
                  ),
                  Label("New Bio:"),
                  Field(
                    hintTxt: "New Bio",
                    icon: _bio,
                    maxLines: 10,
                    validator: (String value) {
                      if (value.isEmpty) return '    Please enter your new Bio';
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      //user.bio = value;
                    },
                  ),
                  Label("New Password:"),
                  Field(
                    hintTxt: "New Password",
                    isPassword: true,
                    icon: _key,
                    validator: (String value) {
                      if (value.isEmpty)
                        return '    Please enter your new Password';
                      if (value.length < 7)
                        return '    Password should be minimum 7 characters';
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      //user.password = value;
                    },
                  ),
                  SizedBox(height: 60),
                  FlatButton(
                    onPressed: () async {
                      print('Submit...');
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        // print(user.email);

                        //String result =
                        //await AuthService.signIn(user.email, user.password);
                        // print(AuthService.auth.currentUser.uid);
                        //if (result == null) {
                        //Navigator.push(
                        //  context, MaterialPageRoute(builder: (context) => MyHome()));
                        //} else {
                        //setState(() {
                        //loginFailed = true;
                        //loginFailedMsg = result;
                        //});
                        //}
                        //}
                      }
                    },
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.orangeAccent,
                    child: Text(
                      'Submit',
                      style: submitTextWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
