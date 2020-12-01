import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ESOF/services/cloud_storage_service.dart';
import 'dart:io';

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

  Future addImage(File img) async{
    var storeImage = new CloudStorageService(img);
    this.imgPath= await storeImage.uploadImage();
  }
}
