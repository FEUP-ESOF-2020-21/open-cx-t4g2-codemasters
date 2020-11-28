import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/style.dart';
import 'package:flutter/material.dart';

class SeeCommentsScreen extends StatefulWidget {
  @override
  _SeeCommentsScreenState createState() => _SeeCommentsScreenState();
}

class _SeeCommentsScreenState extends State<SeeCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments',
                style: bigText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
