import 'package:flutter/material.dart';

import '../../style.dart';

class BioProfile extends StatelessWidget {
  final String bio;
  BioProfile(this.bio);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            this.bio,
            style: smallerText,
          ),
        ],
      ),
    );
  }
}
