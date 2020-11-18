import 'package:cloud_firestore/cloud_firestore.dart';

class ConferenceModel {
  String ref;
  String cid; // Conference id
  String title;
  String date;
  String place;
  String imgPath;
  int rate;
  String description;

  ConferenceMode({Map<String, dynamic> data, String ref}) {
    this.ref = ref;
    if (data != null) {
      this.cid = data['cid'];
      this.title = data['title'];
      this.date = data['date'];
      this.place = data['place'];
      this.imgPath = data['imgPath'];
      this.rate = data['rate'];
      this.description = data['description'];
    }

  }
// table relating conferences and users => to think
