import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'speaker.dart';

class ConferenceModel {
  var ref;
  String title;
  DateTime date;
  String place;
  File img;
  int rate;
  String description;
  String speakers;
  String tag;
  var listSpeakerRef = [];

  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // instance to firestore

  ConferenceModel({Map<String, dynamic> data, String ref}) {
    this.ref = ref;
    if (data != null) {
      this.title = data['title'];
      this.date = data['date'];
      this.place = data['place'];
      this.img = data['imgPath']; // TODO: how to hadle the image.
      this.rate = data['rate'];
      this.description = data['description'];
      this.tag = data['tag'];
    }
  }

  Future confSetup() async {
    findSpeakersRef();
    // gets the reference to add reference to conference_speaker.
    this.ref = await firestore.collection('Conference').add({
      'title': this.title,
      'date': this.date,
      'location': this.place,
      'rate': this.rate,
      'description': this.description,
      'tag': this.tag
    });
    print("conferece");
    print(this.ref);
    return this.ref;
  }

  // If speaker found return ref,
  Future findSpeakersRef() async {

    var usernames = this.speakers.split(new RegExp(r'; |, |\*|\n'));

    for (var username in usernames) {
      // If there is a speaker with this username in database.
        firestore
            .collection("Speaker")
            .where("username", isEqualTo: username)
            .get()
            .then((speakerRef) async {
          if (speakerRef.docs.length == 0) {
            Speaker speaker = new Speaker.overloadConstructor(username);
            final speakerRef = await speaker.speakerSetup();
            listSpeakerRef.add(speakerRef);
            print(speakerRef);
          }
          else{
            listSpeakerRef.add(speakerRef.docs[0].data());
            print(speakerRef.docs[0].reference);
          }
        });

    }
  }

  Future addToConferenceTable(ConferenceRef, Speakers) async {

  }
}
// table relating conferences and users => to think
