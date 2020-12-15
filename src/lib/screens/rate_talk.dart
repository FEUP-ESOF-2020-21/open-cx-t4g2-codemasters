import 'package:ESOF/auth/Authentication.dart';
import 'package:ESOF/database/databaseService.dart';
import 'package:ESOF/style.dart';
import 'package:ESOF/ui_elements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateTalkScreen extends StatefulWidget {
  final DocumentReference currentConf;
  RateTalkScreen({this.currentConf});

  @override
  _RateTalkScreenState createState() =>
      _RateTalkScreenState(currentConf: this.currentConf);
}

class _RateTalkScreenState extends State<RateTalkScreen> {
  num _rating = 3.0;
  String _rate_description = "It was OK";

  final DocumentReference currentConf;
  _RateTalkScreenState({this.currentConf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select the rating:',
                  style: bigText,
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {
                        String rate_description;
                        switch (rating.round()) {
                          case 0:
                            rate_description =
                                'The worst experience of my life';
                            break;
                          case 1:
                            rate_description = 'Hated It';
                            break;
                          case 2:
                            rate_description = 'Disliked It';
                            break;
                          case 3:
                            rate_description = 'It was OK';
                            break;
                          case 4:
                            rate_description = 'Liked It';
                            break;
                          case 5:
                            rate_description = 'Loved It';
                            break;
                          default:
                            rate_description = "";
                        }
                        setState(() {
                          _rating = rating;
                          _rate_description = rate_description;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  _rate_description,
                  style: descriptionTextFeed,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rating: ',
                      style: mediumText,
                    ),
                    Text(
                      _rating.toString(),
                      style: mediumText,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.orangeAccent,
                      onPressed: () {
                        DatabaseService.updateUserRating(
                            AuthService.auth.currentUser.uid,
                            this.currentConf,
                            _rating);

                        // Return to Feed
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyHome()));
                      },
                      child: Text(
                        'OK',
                        style: submitTextWhite,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]),
    );
  }
}
