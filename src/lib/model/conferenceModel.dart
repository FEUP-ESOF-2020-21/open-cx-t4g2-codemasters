import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/model/userModel.dart';
import 'package:ESOF/services/cloud_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'speaker.dart';

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
    UserModel userCreator =
        await DatabaseService.getUser(AuthService.auth.currentUser.uid);

    if (this.img != null) await addImage();
    this.ref = await firestore.collection('Conference').add({
      'title': this.title,
      'date': this.date,
      'location': this.place,
      'rate': this.rate,
      'description': this.description,
      'tag': this.tag,
      'img': this.imgURL,
      'user': userCreator.ref
    });
    findSpeakersRef();
  }

  /// If speaker found return ref, otherwise create one.
  Future findSpeakersRef() async {
    print("SPEAKERS");
    var usernames = this.speakers.split(new RegExp(r'; |, |\*|\n'));
    print(usernames);
    var reference;

    for (var username in usernames) {
      print(username);
      reference = await Speaker.getSpeakerRef(username);
      if (reference == null || reference == false) {
        print("HERE");
        Speaker speaker = new Speaker.overloadConstructor(username);
        print("GET");
        print(speaker.username);
        final speakerRef = await speaker.speakerSetup();
        print("REFERENCE");
        print(speakerRef);
        await addToConferenceTable(speakerRef);
      } else {
        await this.addToConferenceTable(reference);
      }
    }
  }

  /// Adds the speaker and coference to the conference_speaker table in firebase.
  Future addToConferenceTable(speakerRef) async {
    await firestore
        .collection("Conference_Speakers")
        .add({'conference': this.ref, 'speaker': speakerRef});
  }

  Future addImage() async {
    var storeImage = new CloudStorageService(this.img);
    this.imgURL = await storeImage.uploadImage();
  }

  /// Function created for debug proposals.
  void printVariables() {
    List elements = [
      this.title,
      this.date,
      this.speakers,
      this.description,
      this.place,
      this.tag,
      this.img
    ];
    List elementsName = [
      '--TITLE:',
      '--DATE:',
      '--SPEAKERS',
      '--DESCRIPTION',
      '--PLACE',
      '--TAG',
      '--IMG'
    ];
    for (int i = 0; i < 7; i++) {
      print(elementsName[i]);
      print(elements[i]);
    }
  }
}
