import 'dart:convert';

import 'package:ESOF/services/cloud_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'speaker.dart';
import '../services/cloud_storage_result.dart';

class ConferenceModel {
  var ref;
  String title;
  DateTime date;
  String place;
  File img;
  String imgURL;
  int rate;
  String description;
  String speakers = "";
  String tag;

  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // instance to firestore

  Future confSetup() async {
    // gets the reference to add reference to conference_speaker.
    await addImage();
    this.ref = await firestore.collection('Conference').add({
      'title': this.title,
      'date': this.date,
      'location': this.place,
      'rate': this.rate,
      'description': this.description,
      'tag': this.tag,
      'img': this.imgURL
    });
    findSpeakersRef();
  }

  // If speaker found return ref, otherwise create one.
  Future findSpeakersRef() async {
    var usernames = this.speakers.split(new RegExp(r'; |, |\*|\n'));
    var reference;
    for (var username in usernames) {
      reference = await Speaker.getSpeakerRef(username);
      if (reference == false) {
        Speaker speaker = new Speaker.overloadConstructor(username);
        final speakerRef = await speaker.speakerSetup();
        await addToConferenceTable(speakerRef);
      } else {
        await this.addToConferenceTable(reference);
      }
    }
  }

  Future addToConferenceTable(speakerRef) async {
    await firestore
        .collection("Conference_Speakers")
        .add({'conference': this.ref, 'speaker': speakerRef});
  }

  Future addImage() async {
    var storeImage = new CloudStorageService(this.img);
    this.imgURL = await storeImage.uploadImage();
  }

// Function created for debug proposals.
  void printVariables() {
    List elements = [
      this.title,
      this.date,
      this.speakers,
      this.description,
      this.place,
      this.tag
    ];
    List elementsName = [
      '--TITLE:',
      '--DATE:',
      '--SPEAKERS',
      '--DESCRIPTION',
      '--PLACE',
      '--TAG'
    ];
    for (int i = 0; i < 6; i++) {
      print(elementsName[i]);
      print(elements[i]);
    }
  }
}
