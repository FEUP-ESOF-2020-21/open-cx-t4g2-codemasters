import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ConferenceModel {
  String ref;
  String cid; // Conference id
  String title;
  DateTime date;
  String place;
  File img;
  int rate;
  String description;
  String speakers;

  // ignore: non_constant_identifier_names
  ConferenceMode({Map<String, dynamic> data, String ref}) {
    this.ref = ref;
    if (data != null) {
      this.cid = data['cid'];
      this.title = data['title'];
      this.date = data['date'];
      this.place = data['place'];
      this.img = data['imgPath']; // TODO: how to hadle the image.
      this.rate = data['rate'];
      this.description = data['description'];
    }
  }

    Future userSetup() async {
      final dbReference = FirebaseFirestore.instance;

      return await dbReference.collection('Conference').add({
        'title': this.title,
        'data': this.date,
        'place': this.place,
        'img': this.img,
        'rate': this.rate,
        'description': this.description
      });
    }
  }
// table relating conferences and users => to think
