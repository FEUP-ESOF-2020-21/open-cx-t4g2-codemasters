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

  Field(
      {this.hintTxt,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: inputBoxDecoration,
      height: 60.0,
      width: 278,
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
