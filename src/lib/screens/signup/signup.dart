import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';
import "label.dart";
import 'field.dart';
import '../../ui_elements.dart';

class SignupScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: navigationBar,
        body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [new Label("name"), new Field("name", null)],
            )));
  }
}
