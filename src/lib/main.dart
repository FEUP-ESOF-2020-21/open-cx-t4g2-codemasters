import 'package:ESOF/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login.dart';
import 'ui_elements.dart';

void main() => runApp(MyApp());

Future<User> getCurrentUser() async => await FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
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
