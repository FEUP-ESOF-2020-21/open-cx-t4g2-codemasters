import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../style.dart';
import '../../ui_elements.dart';

class Field extends StatelessWidget {
  final String hintTxt;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final Icon icon;
  final double width;
  final double height;

  Field(
      {this.hintTxt,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      this.icon,
      this.width = 278,
      this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: inputBoxDecoration,
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
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
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
