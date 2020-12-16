import 'package:flutter/material.dart';

import '../../style.dart';

class ProfileName extends StatelessWidget {
  final String name;
  ProfileName(this.name);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.name,
      style: profileNameText,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      key: Key('Name'),
    );
  }
}
