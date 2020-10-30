import 'package:flutter/material.dart';
import "../../style.dart";

class RecommendedCarousel extends StatelessWidget {
  final List<String> conferences = [
    'ajsdfioa',
    'dsovf',
    'nddv',
    'vdjnvdv',
    'ajsdfioa',
    'dsovf',
    'nddv',
    'vdjnvdv',
    'ajsdfioa',
    'dsovf',
    'nddv',
    'vdjnvdv'
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
          onTap: () =>
              print('Entered in the conference info: ' + conferences[i]),
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
                SizedBox(height: 10),
                Text(
                  conferences[i],
                  style: smallerText,
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
