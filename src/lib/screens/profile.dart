import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/model/userModel.dart';
import 'package:ESOF/screens/talks_added_by_user.dart';
import 'package:ESOF/widgets/profile/bio.dart';
import 'package:ESOF/widgets/profile/counter_container.dart';
import 'package:ESOF/widgets/profile/edit_profile.dart';
import 'package:ESOF/widgets/profile/name.dart';
import 'package:ESOF/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print(AuthService.auth.currentUser.uid);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: DatabaseService.getUser(AuthService.auth.currentUser.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data;

                return ListView(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        displayPhoto(user),
                        SizedBox(height: 10.0),
                        ProfileName(user.username),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              onPressed: () => print('Showing user rates...'),
                              child: CounterCountainer('rates', user.nRatings),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TalksAddedByUserScreen())),
                              child: CounterCountainer('posts', user.nPosts),
                            ),
                            FlatButton(
                              onPressed: () =>
                                  print('Showing user watchers...'),
                              child: CounterCountainer('watched', 1242),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    BioProfile(user.description),
                    SizedBox(height: 10.0),
                    EditProfile(),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
