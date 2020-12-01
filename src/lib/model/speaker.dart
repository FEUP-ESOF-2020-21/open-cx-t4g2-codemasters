import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Speaker {
  // final int id;
  String _username;
  String _name = "unknown";
  int rating = 0;
  String _image = "";
  String _description = "";

  final firestore = FirebaseFirestore.instance;

  Speaker(this._name, this.rating, this._image);

  Speaker.overloadConstructor(this._username);

  String get name {
    return _name;
  }

  String get imagePath {
    return _image;
  }

  String get username{
    return _username;
  }

  Future speakerSetup() async {
    final uid = FirebaseAuth.instance.currentUser;

    return await firestore.collection("Speaker").add({
      'description': this._description,
      'name': this._name,
      'rating': this.rating,
      'username': this._username,
      'user_creator': uid.uid
    });
  }


  /// Returns firebase reference to speaker with username give.
  /// Case the username doesn't exist, return false, true otherwise.
  static Future getSpeakerRef(username) async {
    await FirebaseFirestore.instance.collection("Speaker")
    .where('username', isEqualTo: username)
    .get()
    .then((speakerRef) async{
      if (speakerRef.docs.length == 0) return false;      // Speaker doesn't exist
      return speakerRef.docs[0].reference;
    });
  }
}
