import 'package:ESOF/model/conference.dart';
import 'package:ESOF/screens/post.dart';
import 'package:ESOF/widgets/common/feed_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ESOF/style.dart';

class ConferenceSearch extends SearchDelegate<String> {
  List<Map<String, dynamic>> conferences = [];
  List<DocumentReference> conferencesRef = [];

  bool _checkIfQueryContains(DocumentSnapshot doc, String keyword) {
    return doc
        .data()[keyword]
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase());
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 35.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Search Results",
                style: bigText,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
                displayConferences(context, conferences, conferencesRef, true),
          ),
        ],
      ),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Conference').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        if (query == '') return new Text('');

        List<DocumentSnapshot> results = snapshot.data.documents
            .where((result) =>
                _checkIfQueryContains(result, 'title') ||
                _checkIfQueryContains(result, 'location') ||
                _checkIfQueryContains(result, 'tag'))
            .toList();

        this.conferences.clear();
        this.conferencesRef.clear();

        results.forEach((result) {
          this.conferences.add(result.data());
          this.conferencesRef.add(result.reference);
        });

        return ListView(
          children: results
              .map<Widget>((result) => ListTile(
                    title: Text(result.data()['title']),
                    onTap: () {
                      var conference = result.data();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //mudar para novo contrutor
                          builder: (context) => PostScreen(
                            new Conference(
                                hasImage(conference),
                                conference['title'],
                                DateTime.fromMillisecondsSinceEpoch(
                                    conference['date'].seconds * 1000),
                                conference['location'],
                                conference['description'],
                                conference['rate'],
                                conference['tag'],
                                result.reference),
                          ),
                        ),
                      );
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
