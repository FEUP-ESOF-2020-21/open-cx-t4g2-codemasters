import 'package:flutter/material.dart';

import '../../style.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressedFunc;
  final EdgeInsets margin;

  Button({this.onPressedFunc, this.buttonText, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: FlatButton(
        onPressed: onPressedFunc,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          buttonText,
          style: submitTextWhite,
        ),
        color: Colors.orangeAccent,
      ),
    );
  }
}
