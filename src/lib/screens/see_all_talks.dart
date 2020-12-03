import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class SeeAllTalksScreen extends StatelessWidget {
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef = [];
  final String sortBy;

  SeeAllTalksScreen(this.sortBy);

  List<Widget> drawAllTalks(context, List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);
    });
    if (this.sortBy == "Recommended") {
      // fazer algoritmo que nos dá uma pontuação de recomendação
    } else if (this.sortBy == "Top Rated") {
      conferences
          .sort((conf1, conf2) => conf2['rate'].compareTo(conf1['rate']));
    } else if (this.sortBy == "Coming Next") {
      conferences
          .sort((conf1, conf2) => conf1['date'].compareTo(conf2['date']));
    }
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
                      children: drawAllTalks(context, snapshot.data.documents),
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
