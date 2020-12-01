import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/widgets/common/RatingStars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeCommentsScreen extends StatefulWidget {
  final DocumentReference currentConf;
  SeeCommentsScreen({this.currentConf});

  @override
  _SeeCommentsScreenState createState() =>
      _SeeCommentsScreenState(currentConf: this.currentConf);
}

class _SeeCommentsScreenState extends State<SeeCommentsScreen> {
  final DocumentReference currentConf;
  _SeeCommentsScreenState({this.currentConf});

  Widget displayComments(List<Map<String, dynamic>> comments) {
    List<Widget> containers = [];
    for (int i = 0; i < comments.length; i++) {
      containers.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: 350,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    comments[i]['user'],
                    style: smallerText,
                  ),
                  SizedBox(width: 10),
                  RatingStars(comments[i]['rating']),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                comments[i]['comment'],
                style: mediumText,
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: containers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        children: [
          Text(
            'Comments',
            style: bigText,
          ),
          SizedBox(height: 30),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FutureBuilder(
                future: DatabaseService.getConferenceComments(this.currentConf),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return displayComments(snapshot.data);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ]),
        ],
      ),
    );
  }
}
