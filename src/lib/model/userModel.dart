import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  String description;
  String imgPath;
  String uid;
  DocumentReference ref;
  int rate;

  String password;
  String email;

  UserModel({Map<String, dynamic> data, DocumentReference ref}) {
    this.ref = ref;

    if (data != null) {
      this.uid = data['uid'];
      this.username = data['username'];
      this.description = data['description'];
      this.imgPath = data['imgPath'];
      this.rate = data['rate'];
    }
  }
}
