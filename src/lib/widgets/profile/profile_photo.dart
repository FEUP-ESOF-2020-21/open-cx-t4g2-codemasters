import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePhoto extends StatelessWidget {
  final String assetUrl;
  ProfilePhoto(this.assetUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.assetUrl),
        ),
      ),
    );
  }
}

/// Show image from the network
class ProfilePhotoNetwork extends StatelessWidget {
  final String _image;

  ProfilePhotoNetwork(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(this._image),
        ),
      ),
    );
  }
}


/// Show image from the network
class ProfilePhotoFile extends StatelessWidget {
  final File _image;

  ProfilePhotoFile(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(this._image),
        ),
      ),
    );
  }
}

