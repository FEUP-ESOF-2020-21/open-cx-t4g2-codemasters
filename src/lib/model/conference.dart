import 'package:cloud_firestore/cloud_firestore.dart';
import "speaker.dart";

class Conference {
  final String _photo;
  final String _title;
  final DateTime _happensOn;
  final String _place;
  final int _rating;
  final String _tag;

  DocumentReference _confReference;

  final String _description;

  Conference(this._photo, this._title, this._happensOn, this._place,
      this._description, this._rating, this._tag, this._confReference);
  /*
  void addPhoto(String photoPath) {
    this._photo = photoPath;
  }*/

  DateTime get date {
    return _happensOn;
  }

  String get place {
    return _place;
  }

  Future<List<Speaker>> getSpeakers() async {
    // List<Speaker> confSpeaker = [];

    Future<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('Conference_Speakers')
        .where('conference', isEqualTo: _confReference)
        .get();

    List<Speaker> speakerRef = [];

    await stream.then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        DocumentReference speaker = value.docs[i].data()['speaker'];
        // print(speaker);
        // speakerRef.add(speaker);
        DocumentSnapshot sp = await speaker.get();

        Map<String, dynamic> speakerObj = sp.data();
        // print(speakerObj);
        Speaker toAdd = new Speaker(speakerObj['name'], speakerObj['rate'],
            'assets/images/default_profile_icon.jpeg');
        speakerRef.add(toAdd);
        // print(confSpeaker);
      }
    });
    // print(speakerRef);
    return speakerRef;
  }

  String get description {
    return _description;
  }

  String get photoPath {
    return _photo;
  }

  String get title {
    return _title;
  }

  String get tag {
    return _tag;
  }
}
