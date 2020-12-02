import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class SeeAllTalksScreen extends StatefulWidget {
  @override
  _SeeAllTalksScreenState createState() => _SeeAllTalksScreenState();
}

class _SeeAllTalksScreenState extends State<SeeAllTalksScreen> {
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef = [];

  List<Widget> drawAllTalks(List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);
    });
    return displayConferences(context, conferences, conferencesRef);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Conference").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All Talks',
                          style: bigText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: drawAllTalks(snapshot.data.documents),
                    ),
                  ],
                ),
              );
            }
          }),
      resizeToAvoidBottomPadding: false,
    );
  }
}
