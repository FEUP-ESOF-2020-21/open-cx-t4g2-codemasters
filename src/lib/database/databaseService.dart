import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ESOF/model/userModel.dart';

class DatabaseService {
  static final dbReference = FirebaseFirestore.instance;

  static Future<UserModel> getUser(String uid) async {
    Query query = dbReference.collection('Users').where('uid', isEqualTo: uid);

    QuerySnapshot user = await query.get();

    Map<String, dynamic> userData = user.docs[0].data();
    UserModel userM = UserModel(data: userData, ref: user.docs[0].id);

    return userM;
  }
}
