import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/feed/recommended_carousel.dart';
import '../widgets/feed/top_rated_carousel.dart';
import '../widgets/feed/coming_next_carousel.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final int minRate = 4;

  List<DocumentSnapshot> filterTopRate(
      List<DocumentSnapshot> totalConferences) {
    return totalConferences
        .where((conference) => conference['rate'] > minRate)
        .toList();
  }

  List<DocumentSnapshot> filterComingNext(
      List<DocumentSnapshot> totalConferences) {
    return totalConferences.where((conference) {
      DateTime confTime = DateTime.fromMillisecondsSinceEpoch(
          conference['date'].seconds * 1000);

      return confTime.compareTo(DateTime.now()) > 0;
    }).toList();
  }

  List<DocumentSnapshot> filterRecommended(
      List<DocumentSnapshot> totalConferences, List<String> userFavoriteTags) {
    // print('OH YES');
    // print(userFavoriteTags);
    return totalConferences;
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
              // filterRecommended(snapshot.data.documents, userFavoriteTags);
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  children: <Widget>[
                    // We still need to parse the documents regarding each Category!
                    SizedBox(height: 20.0),
                    FutureBuilder(
                        future: DatabaseService.getUserFavoriteTags(
                            AuthService.auth.currentUser.uid),
                        builder: (context, snapTags) {
                          if (snapTags.hasData)
                            return RecommendedCarousel(filterRecommended(
                                snapshot.data.documents, snapTags.data));
                          else
                            return Center(
                                child:
                                    CircularProgressIndicator()); // passar as conferencias ordenadas por recomendação
                        }),
                    SizedBox(height: 20.0),
                    //TopRatedCarousel(),
                    TopRatedCarousel(filterTopRate(snapshot.data
                        .documents)), // passar as conferencias ordenadas por rating
                    SizedBox(height: 20.0),
                    //ComingNextCarousel(),
                    ComingNextCarousel(filterComingNext(snapshot.data
                        .documents)), // passar as conferencias ordenadas por data
                  ],
                ),
              );
            }
          }),
      resizeToAvoidBottomPadding: false,
    );
  }
}
