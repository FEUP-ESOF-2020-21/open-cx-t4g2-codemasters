import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';
import '../../ui_elements.dart';

class Field extends StatelessWidget {
  final String hintTxt;
  final Function validator;
  final Function onSaved;
  final TextInputType inputType;
  final Icon icon;
  final bool isPassword;
  final double width;
  final double height;
  final int maxLines;
  final EdgeInsetsGeometry padding;

  Field(
      {this.hintTxt,
      this.validator,
      this.onSaved,
      this.inputType = TextInputType.text,
      this.icon,
      this.isPassword = false,
      this.width = 278,
      this.height = 60,
      this.maxLines = 1,
      this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: inputBoxDecoration,
      height: height,
      width: width,
      padding: padding,
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: inputType,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: icon,
          hintText: hintTxt,
          hintStyle: hintText,
        ),
        obscureText: isPassword,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
