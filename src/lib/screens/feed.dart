import 'package:ESOF/widgets/feed/feed_carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../ui_elements.dart';
import '../widgets/feed/recommended_carousel.dart';
import '../widgets/feed/top_rated_carousel.dart';
import '../widgets/feed/coming_next_carousel.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, String>> conferences = [
    // tratar disto no backend
    {
      'title': 'title0',
      'description':
          'descri ption1descri ption1de scription1descrip tion1descrip tion1 description1descr iption1description1'
    },
    {
      'title': 'title1',
      'description':
          'description2descrip tion2des cription2 description2descripti on2descripti on2description 2description2'
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
    return Scaffold(
      body: new StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Conference").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('No Data...');
            } else {
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  children: <Widget>[
                    // We still need to parse the documents regarding each Category!
                    SizedBox(height: 20.0),
                    RecommendedCarousel(snapshot.data
                        .documents), // passar as conferencias ordenadas por recomendação
                    SizedBox(height: 20.0),
                    //TopRatedCarousel(),
                    TopRatedCarousel(snapshot.data
                        .documents), // passar as conferencias ordenadas por rating
                    SizedBox(height: 20.0),
                    //ComingNextCarousel(),
                    ComingNextCarousel(snapshot.data
                        .documents), // passar as conferencias ordenadas por data
                  ],
                ),
              );
            }
          }),
      resizeToAvoidBottomPadding: false,
      appBar: appBar,
      bottomNavigationBar: navigationBar,
    );
  }
}
