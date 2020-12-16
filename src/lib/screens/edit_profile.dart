import 'dart:io';

import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/model/userModel.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ESOF/widgets/profile/profile_photo.dart';

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

  /// Upload image
  File _imageFile;
  final _picker = ImagePicker();

  UserModel user = UserModel();
  bool editProfileFailed = false;
  String editProfileMsg;

  Future letUserPickImage(UserModel userModel) async {
    final image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
      } else
        print("No image selected!");
    });
  }

  GestureDetector generateImageRow(UserModel userModel) {
    return GestureDetector(
      child: Container(
          child: _imageFile == null
              ? displayPhoto(userModel)
              : ProfilePhotoFile(_imageFile)),
      onTap: () => letUserPickImage(userModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    Column mainColumn = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Label("New Photo:"),
        SizedBox(height: 20),
        generateImageRow(user),
        SizedBox(height: 20),
        Label("New Name:"),
        Field(
          hintTxt: "New Name",
          icon: _username,
          validator: (String value) {
            _formKey.currentState.save();
          },
          onSaved: (String value) {
            user.username = value;
          },
        ),
        Label("New Email:"),
        Field(
          hintTxt: "New Email",
          icon: _email,
          validator: (String value) {
            _formKey.currentState.save();
          },
          onSaved: (String value) {
            user.email = value;
          },
        ),
        Label("New Bio:"),
        Field(
          height: 87,
          hintTxt: "\nNew Bio",
          icon: _bio,
          maxLines: 10,
          validator: (String value) {
            _formKey.currentState.save();
          },
          onSaved: (String value) {
            user.description = value;
          },
        ),
        Label("New Password:"),
        Field(
          hintTxt: "New Password",
          isPassword: true,
          icon: _key,
          validator: (String value) {
            _formKey.currentState.save();
          },
          onSaved: (String value) {
            user.password = value;
          },
        ),
        editProfileFailed
            ? Container(
                margin:
                    new EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
                child: Text(
                  'Edit Profile Failed! - ' + editProfileMsg,
                  style: errorMessageText,
                ),
              )
            : Text(''),
        SizedBox(height: 60),
        FlatButton(
          onPressed: () async {
            // print('Submit...');
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              UserModel userM = await DatabaseService.getUser(
                  AuthService.auth.currentUser.uid);

              bool profileChanged = false;
              String resultEmail, resultPassword;

              if (user.email != "") {
                resultEmail = await AuthService.updateEmail(user.email);
                profileChanged = (resultEmail == null);
              }

              if (resultEmail == null && user.password != "") {
                resultPassword =
                    await AuthService.updatePassword(user.password);
                profileChanged = (resultPassword == null);
              }

              if (resultEmail == null && resultPassword == null) {
                if (user.username != "") {
                  userM.username = user.username;
                  profileChanged = true;
                }
                if (user.description != "") {
                  userM.description = user.description;
                  profileChanged = true;
                }
                if (this._imageFile != null) {
                  await user.addImage(this._imageFile);
                  userM.imgPath = user.imgPath;
                  profileChanged = true;
                }

                if (profileChanged) {
                  await DatabaseService.updateUser(userM.ref, userM.username,
                      userM.description, userM.imgPath);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHome()));
                }
              }

              if (!profileChanged) {
                setState(() {
                  editProfileFailed = true;
                  editProfileMsg = 'Nothing was inserted.';
                  if (resultEmail != null)
                    editProfileMsg = resultEmail;
                  else if (resultPassword != null)
                    editProfileMsg = resultPassword;
                });
              }
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
            key: Key('submitBtn'),
          ),
        ),
      ],
    );
    SafeArea safeArea = new SafeArea(
      child: ListView(
        key: Key('List'),
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
          mainColumn,
        ],
      ),
    );

    return Scaffold(
      body: Form(
        key: _formKey,
        child: safeArea,
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
