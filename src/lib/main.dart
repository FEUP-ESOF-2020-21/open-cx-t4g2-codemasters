import 'package:ESOF/screens/login.dart';
import 'package:ESOF/screens/feed.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FeedScreen());
  }
}
