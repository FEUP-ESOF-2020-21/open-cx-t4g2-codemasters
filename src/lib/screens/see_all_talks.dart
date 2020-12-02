import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/post.dart';
import 'package:ESOF/widgets/common/RatingStars.dart';
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

  hasImage(conference) {
    return conference['img'] == null
        ? 'http://www.theides.org/img/about.jpg'
        : conference['img'];
  }

  List<Widget> drawAllTalks(List<DocumentSnapshot> confs) {
    confs.forEach((conf) {
      this.conferences.add(conf.data());
      this.conferencesRef.add(conf.reference);
    });
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
            margin: EdgeInsets.all(20.0),
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.orangeAccent,
                  blurRadius: 3.0,
                ),
              ],
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
