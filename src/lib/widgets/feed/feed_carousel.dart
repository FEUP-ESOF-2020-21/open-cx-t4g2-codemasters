import 'package:flutter/material.dart';
import '../../style.dart';

abstract class FeedCarousel extends StatelessWidget {
  final String title;
  final List<Map<String, String>> conferences;

  FeedCarousel(this.title, this.conferences);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.title,
                style: mediumText,
              ),
              GestureDetector(
                onTap: () => print('See all pressed'),
                child: Text(
                  'See All',
                  style: seeAllTextFeed,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 250.0,
          color: Colors.transparent,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: displayConferences(),
          ),
        ),
      ],
    );
  }

  List<GestureDetector> displayConferences() {
    List<GestureDetector> containers = [];
    for (int i = 0; i < conferences.length; i++) {
      containers.add(
        GestureDetector(
          onTap: () => print(
              'Entered in the conference info: ' + conferences[i]['title']),
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('assets/images/conference_test.jpg'),
                    fit: BoxFit.cover,
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
}
