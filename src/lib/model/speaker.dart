class Speaker {
  final int id;
  final String _name;
  final int rating;
  final String _image;

  Speaker(this._name, this.id, this.rating, this._image);

  String get name {
    return _name;
  }

  String get imagePath {
    return _image;
  }
}
