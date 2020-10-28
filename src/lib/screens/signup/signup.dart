import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../../style.dart";
import "field.dart";
import "../../ui_elements.dart";


class SignupScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: navigationBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Text('helo')

          ),


        ],
      )
    );
  }
}


