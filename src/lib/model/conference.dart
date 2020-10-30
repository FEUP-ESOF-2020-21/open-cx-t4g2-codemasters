import "package:flutter/material.dart";
import "speaker.dart";

class Conference {
  final String _photo;
  final String _title;
  final DateTime _happensOn;
  final String _place;
  final int _rating;

  List<Speaker> _speakers = [];
  final String _description;

  Conference(this._photo, this._title, this._happensOn, this._place,
      this._description, this._rating);
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

  List<Speaker> get speakers {
    return _speakers;
  }

  String get description {
    return _description;
  }
}
