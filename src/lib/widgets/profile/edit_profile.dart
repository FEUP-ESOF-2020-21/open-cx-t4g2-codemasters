import 'package:flutter/material.dart';

import '../../style.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
    );
  }
}
