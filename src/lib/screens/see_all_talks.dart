import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class SeeAllTalksScreen extends StatelessWidget {
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef = [];
  List<DocumentSnapshot> confs;
  final String title;

  SeeAllTalksScreen(this.confs, this.title);

  List<Widget> drawAllTalks(context, List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);
    });
    return displayConferences(context, conferences, conferencesRef, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 35.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: bigText,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: drawAllTalks(context, this.confs),
          ),
        ],
      ),
    ));
  }
}
