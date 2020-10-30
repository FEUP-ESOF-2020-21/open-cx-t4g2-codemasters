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

  Conference(
      {this.photo,
      this.title,
      this.happensOn,
      this.place,
      this.description,
      this.rating});

  void addPhoto(String photoPath) {
    this._photo = photoPath;
  }
}
