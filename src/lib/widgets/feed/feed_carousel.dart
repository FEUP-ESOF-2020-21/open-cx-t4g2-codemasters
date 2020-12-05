import 'package:ESOF/screens/see_all_talks.dart';
import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../style.dart';

abstract class FeedCarousel extends StatelessWidget {
  final String title;
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef =
      []; // Holds references to the Conferences in Firebase

  FeedCarousel(this.title, List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);
    });
  }

  @override
  Widget build(BuildContext context) {
    return conferences.length > 0
        ? Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.title,
                      style: mediumText,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SeeAllTalksScreen(this.title))),
                      child: Text(
                        'See All',
                        style: seeAllTextFeed,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 280.0,
                color: Colors.transparent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      displayConferences(context, conferences, conferencesRef),
                ),
              ),
            ],
          )
        : Text("");
  }
}
