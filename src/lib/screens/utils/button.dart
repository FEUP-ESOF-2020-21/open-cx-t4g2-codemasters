import 'package:flutter/material.dart';

import '../../style.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressedFunc;
  final EdgeInsets margin;
  final EdgeInsets padding;

  

  Button({
    this.onPressedFunc,
    this.buttonText,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.fromLTRB(0, 20, 0, 20)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: FlatButton(
        onPressed: onPressedFunc,
        padding: this.padding,
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
