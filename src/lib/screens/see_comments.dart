import 'package:ESOF/screens/utils/field.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/widgets/common/RatingStars.dart';
import 'package:flutter/material.dart';

class SeeCommentsScreen extends StatefulWidget {
  @override
  _SeeCommentsScreenState createState() => _SeeCommentsScreenState();
}

class _SeeCommentsScreenState extends State<SeeCommentsScreen> {
  List<Map<String, String>> comments = [
    // tratar disto no backend
    {
      'user': 'user1',
      'comment':
          'descri ption1descri ption1de scription1descrip tion1descrip tion1 description1descr iption1description1'
    },
    {
      'user': 'user2',
      'comment':
          'description2descrip tion2des cription2 description2descripti on2descripti on2description 2description2'
    },
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
    {'user': 'userN', 'comment': 'comment...'},
  ];

  List<Widget> displayComments() {
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
                  RatingStars(4),
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
    return containers;
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: displayComments(),
          ),
        ],
      ),
    );
  }
}
