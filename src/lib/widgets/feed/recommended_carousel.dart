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

  List<Container> conferencesContainers() {
    List<Container> containers = [];
    for (int i = 0; i < conferences.length; i++) {
      containers.add(
        Container(
          margin: EdgeInsets.all(10.0),
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            conferences[i],
            style: smallerText,
          ),
        ),
      );
    }
    return containers;
  }
}
