import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ConferenceModel {
  String ref;
  String title;
  DateTime date;
  String place;
  File img;
  int rate;
  String description;
  String speakers;
  String tag;

  ConferenceMode({Map<String, dynamic> data, String ref}) {
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
      final dbReference = FirebaseFirestore.instance;

      return await dbReference.collection('Conference').add({
        'title': this.title,
        'date': this.date,
        'location': this.place,
        'rate': this.rate,
        'description': this.description,
        'tag': this.tag
      });
    }
  }
// table relating conferences and users => to think
