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
    for (int i = comments.length - 1; i >= 0; i--) {
      containers.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent,
                blurRadius: 3.0,
              ),
            ],
          ),
          width: 350,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comments[i]['user'],
                    style: smallerText,
                  ),
                  SizedBox(width: 10),
                  comments[i]['rating'] != -1
                      ? RatingStars(comments[i]['rating'])
                      : Text(""),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                comments[i]['comment'],
                style: mediumText,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Posted on ',
                    style: descriptionTextFeed,
                  ),
                  Text(
                    comments[i]['date'],
                    style: descriptionTextFeed,
                  ),
                ],
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
