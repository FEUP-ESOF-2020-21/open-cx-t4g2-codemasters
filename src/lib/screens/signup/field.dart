import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../../style.dart";
import "../../ui_elements.dart";

class Field extends StatelessWidget {
  String _hint;
  Icon _icon;


  Field(this._hint, this._icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: inputBoxDecoration,
        height: 60.0,
        width: 278,
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 14.0),
            icon: _icon,
            hintText: _hint,
            ),

      ),
    );
  }
}
