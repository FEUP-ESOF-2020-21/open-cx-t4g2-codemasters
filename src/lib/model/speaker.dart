import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Speaker {
  // final int id;
  String _name = "unknown";
  int rating = 0;

  final firestore = FirebaseFirestore.instance;

  Speaker(this._name);


  String get name {
    return _name;
  }

  Future speakerSetup() async {
    final uid = FirebaseAuth.instance.currentUser;

    return await firestore.collection("Speaker").add({
      'name': this._name,
      'user_creator': uid.uid
    });
  }


  /// Returns firebase reference to speaker with the given name.
  /// Case the name doesn't exist, return false, true otherwise.
  static Future getSpeakerRef(name) async {
    await FirebaseFirestore.instance.collection("Speaker")
    .where('name', isEqualTo: name)
    .get()
    .then((speakerRef) async{
      if (speakerRef.docs.length == 0) return false;      // Speaker doesn't exist
      return speakerRef.docs[0].reference;
    });
  }
}
