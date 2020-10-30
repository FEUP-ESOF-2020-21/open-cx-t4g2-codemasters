import 'package:flutter/material.dart';
import "../../style.dart";

class RecommendedCarousel extends StatelessWidget {
  final List<Map<String, String>> conferences = [
    {
      'title': 'title0',
      'description':
          'description1description1description1description1description1description1description1description1'
    },
    {
      'title': 'title1',
      'description':
          'description2description2description2description2description2description2description2description2'
    },
    {'title': 'title2', 'description': 'description3'},
    {'title': 'title3', 'description': 'description4'},
    {'title': 'title4', 'description': 'description5'},
    {'title': 'title5', 'description': 'description6'},
    {'title': 'title6', 'description': 'description7'},
    {'title': 'title7', 'description': 'description8'},
    {'title': 'title8', 'description': 'description9'},
    {'title': 'title9', 'description': 'description10'},
    {'title': 'title10', 'description': 'description11'},
    {'title': 'title11', 'description': 'description12'},
    {'title': 'title12', 'description': 'description13'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recommended',
              style: mediumText,
            ),
            GestureDetector(
              onTap: () => print('See all pressed'),
              child: Text(
                'See All',
                style: smallerText,
              ),
            ),
          ],
        ),
        Container(
          height: 200.0,
          color: Colors.orangeAccent, // just to see the container
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: conferencesContainers(),
          ),
        ),
      ],
    );
  }

  List<GestureDetector> conferencesContainers() {
    List<GestureDetector> containers = [];
    for (int i = 0; i < conferences.length; i++) {
      containers.add(
        GestureDetector(
          onTap: () => print(
              'Entered in the conference info: ' + conferences[i]['title']),
          child: Container(
            margin: EdgeInsets.all(10.0),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image(
                  image: AssetImage('assets/images/conference_test.jpg'),
                ),
                SizedBox(height: 6),
                Text(
                  conferences[i]['title'],
                  style: smallerText,
                ),
                Text(
                  conferences[i]['description'],
                  overflow: TextOverflow
                      .ellipsis, // assim aparecem '...' quando não cabe mais texto
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return containers;
  }
}
