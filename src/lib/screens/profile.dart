import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/screens/utils/label.dart';
import 'package:ESOF/style.dart';
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio',
                    style: bioTitleProfile,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada aliquet lectus, non scelerisque mi imperdiet pharetra. Maecenas posuere nibh sit amet urna hendrerit, ac aliquam ante varius. Donec finibus, libero a fermentum rutrum, nibh turpis suscipit diam, ut fringilla mi elit nec ex. Nam finibus maximus odio non ullamcorper. Cras nec felis quis orci interdum scelerisque. Ut accumsan euismod orci, non laoreet elit auctor sit amet. Integer blandit ex tincidunt, fringilla ipsum sit amet, vehicula erat. Morbi cursus, risus vitae rutrum sagittis, turpis turpis viverra metus, ac efficitur est ex nec eros. Nullam scelerisque rutrum euismod.Nullam sed sollicitudin libero. Sed accumsan augue eu nulla porta tempor. Integer iaculis, elit et semper venenatis, metus massa ornare arcu, ac elementum tortor est feugiat magna. In sit amet mauris nulla. Nulla vitae sodales neque. Pellentesque at consequat augue, et porttitor augue. Curabitur finibus nibh malesuada porttitor ultricies. Integer tincidunt sapien ut sem placerat dignissim. Cras quis ultrices felis, non tempus erat. Ut vitae ipsum eget quam hendrerit ultrices nec quis erat. Sed hendrerit ligula in iaculis pretium. Suspendisse eu augue et nisi commodo rhoncus. Ut magna leo, congue at tempus nec, convallis at diam. Vestibulum suscipit elit ac mi euismod, non rutrum tellus condimentum. Etiam vel sollicitudin est. Nulla feugiat eleifend lacinia.',
                    style: smallerText,
                  ),
                ],
              ),
            ),
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
