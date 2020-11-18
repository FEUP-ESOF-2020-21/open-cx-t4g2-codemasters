import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';
import '../../ui_elements.dart';

class Label extends StatelessWidget {
  String _label;
  Label(this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 278,
        child: Text(
          _label,
          style: mediumText,
        ),
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10));
  }
}
