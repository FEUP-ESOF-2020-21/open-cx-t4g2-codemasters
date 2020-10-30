import 'package:ESOF/widgets/create_conference/screen_title.dart';
import 'package:flutter/material.dart';

import '../ui_elements.dart';

class CreateConference extends StatefulWidget {
  @override
  _CreateConferenceState createState() => _CreateConferenceState();
}

class _CreateConferenceState extends State<CreateConference> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 35.0),
          children: <Widget>[
            ScreenTitle(),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      appBar: appBar,
      bottomNavigationBar: navigationBar,
    );
    return scaffold;
  }
}
