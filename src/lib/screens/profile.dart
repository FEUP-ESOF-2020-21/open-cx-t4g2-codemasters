import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/label.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/widgets/profile/bio.dart';
import 'package:ESOF/widgets/profile/counter_container.dart';
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 35.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePhoto('assets/images/conference_test.jpg'),
                SizedBox(height: 10.0),
                ProfileName('Profile Name'),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CounterCountainer('rates', 2),
                    CounterCountainer('posts', 1),
                    CounterCountainer('watched', 1242),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            BioProfile(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada aliquet lectus, non scelerisque mi imperdiet phareLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada aliquet lectus, non scelerisque mi imperdiet phLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada aliquet lectus, non scelerisque mi imperdiet phareare'),
            SizedBox(height: 30.0),
            FlatButton(
              onPressed: () => print('Editing profile...'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_outlined,
                    size: 30,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Edit Profile',
                    style: editProfileText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
