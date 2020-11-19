import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/userModel.dart';

Future userSetup(UserModel userModel) async {
  final dbReference = FirebaseFirestore.instance;
  return await dbReference.collection('Users').add({
    'uid': FirebaseAuth.instance.currentUser.uid,
    'username': userModel.username,
    'rate': 0,
    'description': "",
    'imgPath': "",
  });
}
