import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/login.dart';
import 'package:ESOF/screens/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ESOF/screens/signup.dart';
import 'package:flutter/material.dart';
import 'model/speaker.dart';
import 'package:ESOF/style.dart';
import 'screens/post.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'ui_elements.dart';

void main() => runApp(MyApp());

Future<User> getCurrentUser() async => await FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        return MaterialApp(home: MyHome());
      }
      return MaterialApp(home: LoginScreen());
    } catch (e) {
      return MaterialApp(home: LoginScreen());
    }
  }
}
