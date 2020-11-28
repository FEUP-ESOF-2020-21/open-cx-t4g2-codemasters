import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

class AddCommentScreen extends StatefulWidget {
  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
          children: [
            Text(
              'Add Comment:',
              style: bigText,
            ),
          ]),
    );
  }
}
