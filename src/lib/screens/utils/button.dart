import 'package:flutter/material.dart';

import '../../style.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressedFunc;
  
  Button({
    this.onPressedFunc,
    this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
