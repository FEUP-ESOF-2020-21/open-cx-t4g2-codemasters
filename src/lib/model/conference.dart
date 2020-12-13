import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import "speaker.dart";
import 'conferenceModel.dart';

class Conference {
  final String _photo;
  final String _title;
  final DateTime _happensOn;
  final String _place;
  final num _rating;
  final String _tag;

  DocumentReference _confReference;

  final String _description;

  Conference(this._photo, this._title, this._happensOn, this._place,
      this._description, this._rating, this._tag, this._confReference);

  DocumentReference get confReference {
    return _confReference;
  }

  DateTime get date {
    return _happensOn;
  }

  String get place {
    return _place;
  }

  num get rate {
    return _rating;
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

  File get photo {
    return File(_photo);
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
        DocumentSnapshot sp = await speaker.get();

        Map<String, dynamic> speakerObj = sp.data();
        Speaker toAdd = new Speaker(speakerObj['name']);
        speakerRef.add(toAdd);
      }
    });
    return speakerRef;
  }

  ConferenceModel parseConferenceModel(){
    ConferenceModel confModel= new ConferenceModel();
    confModel.title = _title;
    confModel.ref = _confReference;
    confModel.place = _place;
    confModel.rate = _rating;
    confModel.tag = "";
    confModel.imgURL = _photo;


    return confModel;
  }
}
