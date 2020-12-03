// If the conference has image return the url, otherwise returns a default.
import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/post.dart';
import 'package:flutter/material.dart';

import '../../style.dart';
import 'RatingStars.dart';

hasImage(conference) {
  return conference['img'] == null
      ? 'http://www.theides.org/img/about.jpg'
      : conference['img'];
}

List<GestureDetector> displayConferences(context, conferences, conferencesRef) {
  List<GestureDetector> containers = [];
  for (int i = 0; i < conferences.length; i++) {
    containers.add(
      GestureDetector(
        onTap: () {
          print('Entered in the conference info: ' + conferences[i]['title']);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostScreen(new Conference(
                      hasImage(conferences[i]),
                      conferences[i]['title'],
                      DateTime.fromMillisecondsSinceEpoch(
                          conferences[i]['date'].seconds * 1000),
                      conferences[i]['location'],
                      conferences[i]['description'],
                      conferences[i]['rate'],
                      conferences[i]['tag'],
                      conferencesRef[i]))));
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: 160,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(hasImage(conferences[i]),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conferences[i]['title'],
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: mediumText,
                    ),
                    Text(
                      conferences[i]['description'],
                      overflow: TextOverflow.ellipsis,
                      style: descriptionTextFeed,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: RatingStars(conferences[i]['rate'].round()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return containers;
}
