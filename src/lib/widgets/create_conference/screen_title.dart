import 'package:flutter/material.dart';

import 'package:ESOF/style.dart';

class ScreenTitle extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create a Conference',
            style: bigText,
          ),
          SizedBox(height: 10.0),
          Text(
            'Create here a post for the conference',
            style: smallerText,
          ),
        ],
      ),
    );
  }
}
