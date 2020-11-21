import 'package:cloud_firestore/cloud_firestore.dart';


class Speaker {
  // final int id;
  String _username;
  String _name = "";
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

  Future speakerSetup() async{
    return firestore.collection("Speaker").add({
      'description': this._description,
      'name': "",
      'rating': this.rating,
      'username': this._username
    });
  }
}
