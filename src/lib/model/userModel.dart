import 'package:flutter/material.dart';

class UserModel {
  String username;
  String email;
  String password;
  String description;
  String imgPath;
  int rate;

  UserModel({this.username, this.email, this.password}) {
    this.description = "";
    this.imgPath = "";
    this.rate = 0;
  }
}
