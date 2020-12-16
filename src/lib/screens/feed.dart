import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/feed/recommended_carousel.dart';
import '../widgets/feed/top_rated_carousel.dart';
import '../widgets/feed/coming_next_carousel.dart';

class FeedScreen extends StatelessWidget {
  final int minRate = 4;

  List<DocumentSnapshot> filterTopRate(
      List<DocumentSnapshot> totalConferences) {
    return totalConferences
        .where((conference) => conference.data()['rate'] > minRate)
        .toList();
  }

  List<DocumentSnapshot> filterComingNext(
      List<DocumentSnapshot> totalConferences) {
    return totalConferences.where((conference) {
      DateTime confTime = DateTime.fromMillisecondsSinceEpoch(
          conference.data()['date'].seconds * 1000);

      return confTime.compareTo(DateTime.now()) > 0;
    }).toList();
  }

  bool checkConfTag(List<String> confTags, List<String> userFavoriteTags) {
    for (String confTag in confTags)
      if (userFavoriteTags.contains(confTag.toUpperCase())) return true;

    return false;
  }

  List<DocumentSnapshot> filterRecommended_Tags(
      List<DocumentSnapshot> totalConferences, List<String> userFavoriteTags) {
    return totalConferences.where((conference) {
      List<String> separatedTags =
          conference.data()['tag'].split(new RegExp(r'; |, |\*|\n| '));
      return checkConfTag(separatedTags, userFavoriteTags);
    }).toList();
  }

  List<DocumentSnapshot> filterRecommended_NotRatedYet(
      List<DocumentSnapshot> totalConferences,
      List<DocumentReference> userRatedConfs) {
    return totalConferences.where((conference) {
      return !userRatedConfs.contains(conference.reference);
    }).toList();
  }

  List<DocumentSnapshot> filterRecommended(
      List<DocumentSnapshot> totalConferences,
      List<String> userFavoriteTags,
      List<DocumentReference> userRatedConfs) {
    List<DocumentSnapshot> totalRecommendedTags = filterRecommended_Tags(
        totalConferences, userFavoriteTags); // Contains Favorite Tags
    List<DocumentSnapshot> totalRecommendedRate =
        filterTopRate(totalRecommendedTags); // Rate > minRate(4)
    List<DocumentSnapshot> totalRecommendedComingNext =
        filterComingNext(totalRecommendedRate); // ComingNext
    List<DocumentSnapshot> totalRecommended = filterRecommended_NotRatedYet(
        totalRecommendedComingNext, userRatedConfs); // Not rated yet!
    return totalRecommended;
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
                key: Key("Feed"),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  children: <Widget>[
                    // We still need to parse the documents regarding each Category!
                    FutureBuilder(
                        future: Future.wait([
                          DatabaseService.getUserFavoriteTags(
                              AuthService.auth.currentUser.uid),
                          DatabaseService.getUserRatedConfs(
                              AuthService.auth.currentUser.uid)
                        ]),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>> snapTags) {
                          // snapTags.data[0] -> getUserFavoriteTags
                          // snapTags.data[1] -> getUserRatedConfs
                          if (snapTags.hasData)
                            return RecommendedCarousel(filterRecommended(
                                snapshot.data.documents,
                                snapTags.data[0],
                                snapTags.data[1]));
                          else
                            return Center(
                                child:
                                    CircularProgressIndicator()); // passar as conferencias ordenadas por recomendação
                        }),
                    //TopRatedCarousel(),
                    TopRatedCarousel(filterTopRate(snapshot.data
                        .documents)), // passar as conferencias ordenadas por rating
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
