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
  String speakers;
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
          await addToConferenceTable(speakerRef);
        } else {
          await this.addToConferenceTable(speakerRef.docs[0].reference);
        }
      });
    }
  }

  Future addToConferenceTable(speakerRef) async {
    await firestore
        .collection("Conference_Speakers")
        .add({'conference': this.ref, 'speaker': speakerRef});
  }

  Future addImage() async{
    var storeImage = new CloudStorageService(this.img);
    this.imgURL = await storeImage.uploadImage();
  }
}
// table relating conferences and users => to think
